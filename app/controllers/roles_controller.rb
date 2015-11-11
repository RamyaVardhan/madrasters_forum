class RolesController < ApplicationController
	  before_action :load_role, :only => [:show,:edit,:update,:destroy]  

	def index
		@roles = Role.all.order("name")
	end

	def new
		@role =  Role.new()
	end

	def create
    	@role = current_user.roles.build(post_params)

    	if @role.save
			redirect_to @role
		else
			render 'new'
		end
	end

	def update
		if @role.update(post_params)
			redirect_to @role
		else
			render 'edit'
		end
	end

	def destroy
		@role.destroy
		redirect_to root_path
	end

	private
	
	def load_role
		@role = Role.find(params[:id])
	end

	def post_params
		params.require(:role).permit(:name)
	end

end