class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

         has_many :posts
         has_many :comments
         has_and_belongs_to_many :roles,:class_name => "Role", :join_table => :users_roles
         has_many :domains,:class_name => "Domain", :foreign_key => :lead_id
         has_many :events,:class_name => "Event", :foreign_key => :manager_id
         belongs_to :location,:class_name => "Location", :foreign_key => :location_id

  ADMIN_EMAIL = "go2sesha@gmail.com"

  GENDER = [ 
    [1, :male, "Male"],
    [2, :female, "Female"],
  ]
  GENDER_KEY_BY_LABEL = Hash[GENDER.map{|i| [i[0],i[2]]}]


   def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = "#{auth.uid}@facebook.com"
        user.password = Devise.friendly_token[0,20]
      end
  end

  def is_admin?
    self.try(:email).eql?(ADMIN_EMAIL)
  end

  def is_location_manager? location
    self.id == location.try(:manager_id)
  end

  def is_domain_manager? domain
    self.id == domain.try(:lead_id)
  end

  def madraster_location
    self.location.try(:label)
  end

  def gender_label
    GENDER_KEY_BY_LABEL[self.gender] if self.gender
  end
end
