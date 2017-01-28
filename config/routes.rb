Rails.application.routes.draw do
	root 'visits#index'
	match '/visits',  to: 'visits#show', via: 'get'
	match '/visits' => 'visits#create', via: :post
end
