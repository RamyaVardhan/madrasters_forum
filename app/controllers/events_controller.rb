class EventsController < ApplicationController
	before_action :load_metrics, :only => [:new,:edit]
    before_action :load_event, :only => [:show,:edit,:update,:destroy]  

    EVENT_TYPE = [
    	[1, :meetup, "Meetup"],
    	[2, :workshop, "Workshop"]
    ]

    EVENT_TYPE_KEY_BY_ID = Hash[EVENT_TYPE.map{ |i| [i[1],i[0]]}]
    EVENT_TYPE_LABEL_BY_ID = Hash[EVENT_TYPE.map{ |i| [i[2],i[0]]}]

    def index
    	@events = Event.find(:all,:order => :name)
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
		params.require(:event).permit(:name,:description,:type_id,:manager_id,:event_type,:count,
			:venue,:domain_id,:location_id,:speaker_id,:team,:agenda,:event_date,:helpline_number)
	end

	def set_event_type
		(params.merge!({:type => params[:controller].to_sym}))
	end


 	def load_location_event conditions={}
 		conditions.merge!({:event_type => EVENT_TYPE_KEY_BY_ID[params[:type]] }) if params[:type].present? 
    	if params[:location].present?
    		location_id = Location.find_by_name(params[:location]).try(:id)
    		conditions.merge!({:location_id => location_id}) if location_id
    	end
    	if params[:id].present?
    		conditions.merge!({:display_id => params[:id]})
    	end
    	params.merge!(:conditions => conditions)
 	end

 	def load_metrics
 		@metric = {
 			:event_types => EVENT_TYPE_LABEL_BY_ID.to_a,
 			:managers    => User.all.collect { |u| [u.name,u.id] },
 			:branches    => Location.all.collect { |u| [u.label,u.id] },
 			:domains 	 =>  Domain.all.collect { |u| [u.name,u.id] }
 		}
 	end

end