class LocationsController < ApplicationController
    before_action :load_location, :only => [:show,:edit,:update,:destroy]  

    def index
    	@locations = Location.all.order("name")
    end

    def new
    	@location =  Location.new()
    end

    def create
    	@location = current_user.build_location(post_params)
    	@location.name = @location.label.strip().strip().gsub(/\s/, '_').downcase
    	if @location.save
			redirect_to @location
		else
			render 'new'
		end
    end

	def update
		if @location.update(post_params)
			redirect_to @location
		else
			render 'edit'
		end
	end

	def destroy
		@location.destroy
		redirect_to root_path
	end

	private

	def load_location
		@location = Location.find(params[:id])
	end

	def post_params
		params.require(:location).permit(:label,:manager_id,:helpline_number)
	end

end