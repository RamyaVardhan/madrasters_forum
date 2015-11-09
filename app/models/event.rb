class Event < ActiveRecord::Base
	belongs_to :manager,:class_name => "User", :foreign_key => :manager_id
	belongs_to :domain
	belongs_to :location
end