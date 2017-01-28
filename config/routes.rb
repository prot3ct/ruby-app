Rails.application.routes.draw do
	root 'visits#index'
	get '/visits',  to: 'visits#show'
	post '/visits', to: 'visits#create'
end
