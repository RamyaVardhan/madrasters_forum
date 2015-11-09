class Location < ActiveRecord::Base
	belongs_to :manager,:class_name => "User", :foreign_key => :manager_id
	has_many :events
	has_many :users
end