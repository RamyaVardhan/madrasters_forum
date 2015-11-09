class Domain < ActiveRecord::Base
	belongs_to :lead,:class_name => "User", :foreign_key => :lead_id
	has_many :events
end