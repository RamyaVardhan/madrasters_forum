class Event < ActiveRecord::Base
	belongs_to :manager,:class_name => "User", :foreign_key => :manager_id
	belongs_to :domain
	belongs_to :location

	EVENT_TYPE = {
		1 => "Workshop",
		2 => "Meetup"
	}

	def get_event_type
		EVENT_TYPE[self.event_type]
	end

	def branch_name
 		self.location.try(:label)
 	end

 	def domain_name
 		self.domain.try(:name)
 	end

 	def manager_name
 		self.manager.try(:name)
 	end
end