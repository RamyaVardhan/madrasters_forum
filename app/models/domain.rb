class Domain < ActiveRecord::Base
	resourcify
	include Authority::Abilities
	belongs_to :lead,:class_name => "User", :foreign_key => :lead_id
	has_many :events
end