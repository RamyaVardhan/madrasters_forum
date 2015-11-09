class EventsController < ApplicationController
    before_action :load_event, :only => [:show,:edit,:update,:destroy]  

    def index
    	@events = Event.all.order("name")
    end

    def new
    	@event =  Event.new()
    end

    def create
    	@event = current_user.events.build(post_params)

    	if @event.save
			redirect_to @event
		else
			render 'new'
		end
    end

	def update
		if @event.update(post_params)
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy
		@event.destroy
		redirect_to root_path
	end

	private

	def load_event
		@event = Event.find(params[:id])
	end

	def post_params
		params.require(:event).permit(:name,:description,:type_id,:manager_id,:event_type,:count,:venue,:domain_id,:location_id,:speaker_id,:team,:agenda,:event_date)
	end

end