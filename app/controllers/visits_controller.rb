class VisitsController < ApplicationController
    def index
        @data = Visit.all
		render :json => @data
	end
	
	def create 
		@visits = construct
		@visits.update
	end
	
	def show
		@visits = construct
		data = {"count" => @visits.count}
		render :json => data.to_json
	end
end
