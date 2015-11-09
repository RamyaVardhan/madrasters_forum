class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

         has_many :posts
         has_many :comments
         has_many :domains,:class_name => "Domain", :foreign_key => :lead_id
         has_many :events,:class_name => "Event", :foreign_key => :manager_id
         belongs_to :location,:class_name => "Location", :foreign_key => :location_id


   def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = "#{auth.uid}@facebook.com"
        user.password = Devise.friendly_token[0,20]
      end
  end
end
