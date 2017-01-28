class VisitsController < ApplicationController
	
	def index
		@data = Visit.all
		render :json => @data
	end
	
	def create 
		@visits = get_or_create(true)
		@visits.update
	end

	def show
		@visits = get_or_create(false)
		data = {"count" => @visits.count}
		render :json => data.to_json
	end
	
	def get_or_create(hasToCreate) 
		if (!Visit.exists?(user: params[:user]) && hasToCreate) 
			visit = Visit.new
			visit.user = params[:user]
			visit.save
			return visit;
		end
		
		return Visit.find_by(user: params[:user])
	end
end
