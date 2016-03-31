class MeetupController < EventsController
 	
 	before_action :set_event_type, :only => [:index,:show]
 	before_action :load_location_event, :only =>[:index,:show]
 	skip_before_action :load_event,:only => [:show]

 	def index
 		@events = Event.find(:all,:conditions => params[:conditions],:order => :name)
 	end

 	def show
 		@event = Event.find(:first,:conditions => params[:conditions])
 	end
end