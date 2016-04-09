class DomainsController < ApplicationController
	  before_action :load_domain, :only => [:show,:edit,:update,:destroy]  
	  skip_before_filter :authenticate_user!, :only => :index
	  
	def index	
		@domains = Domain.all.order("name")
	end

	def new
		@domain =  Domain.new()
	end

	def create
    	@domain = current_user.domains.build(post_params)

    	if @domain.save
			redirect_to @domain
		else
			render 'new'
		end
	end

	def update
		if @domain.update(post_params)
			redirect_to @domain
		else
			render 'edit'
		end
	end

	def destroy
		@domain.destroy
		redirect_to root_path
	end

	private
	
	def load_domain
		@domain = Domain.find(params[:id])
	end

	def post_params
		params.require(:domain).permit(:name,:lead_id)
	end

end