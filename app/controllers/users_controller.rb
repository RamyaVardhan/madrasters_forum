class UsersController < ApplicationController
	skip_before_filter :authenticate_user!, :only => :index
	before_filter :load_metrics, :only => [:new,:edit]
	before_filter :load_user, :only => [:show,:edit]

	GENDER = [ 
		[1, :male, "Male"],
		[2, :female, "Female"],
	]

	GENDER_KEY_BY_LABEL = Hash[GENDER.map{|i| [i[2],i[0]]}]

	def index
		@users = User.all
	end

	def new
		@user= User.new
	end

	def create
		@user = User.new(post_params)
		debugger
		if @user.save
			redirect_to @user
		else
			load_metrics
			render 'edit'
		end
	end

	def show

	end

	private

	def load_metrics
		@metric = {
			:gender => GENDER_KEY_BY_LABEL,
			:branches => Location.all.collect { |u| [u.label,u.id] }
		}	
	end

	def post_params
		params.require(:user).permit(:name,:password,:email,:gender,:dob,:profession,:location_id)
	end

	def load_user
		@user = User.find(params[:id])
	end
end
