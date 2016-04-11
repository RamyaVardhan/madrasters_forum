class DashboardController < ApplicationController
	skip_before_filter :authenticate_user!, :only => :index
	def index
		@users = User.all
	end
end