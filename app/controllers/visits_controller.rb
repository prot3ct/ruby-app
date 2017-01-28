class VisitsController < ApplicationController
	def index
		render "welcome"
	end

	def create 
		visit = construct
		visit.update
		redirect_to '/'
	end
	
	def show
		visit = construct
		data = {"count" => visit.count}
		render :json => data.to_json
	end
	
	def construct 
		if !Visit.exists?(user: params[:user]) 
			visit = Visit.new
			visit.user = params[:user]
			visit.save
		end
		
		return Visit.find_by(user: params[:user])
	end
end
