class VisitsController < ApplicationController
	
	def index
		@data = Visit.all
		render :json => @data
	end
	
	def create 
		@visits = construct
		@visits.update
	end
	
	def user_count
		user = Visit.find_by(user: params[:user])
		data = {"count" => user.count}
	end

	def show
		@visits = construct
		data = {"count" => @visits.count}
		render :json => data.to_json
	end
	
	def construct 
		if !Visit.exists?(user: params[:user]) 
			@visits = Visit.new
			@visits.user = params[:user]
			@visits.save
			return @visits;
		end
		
		return Visit.find_by(user: params[:user])
	end
end
