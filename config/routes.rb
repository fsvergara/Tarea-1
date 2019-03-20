Rails.application.routes.draw do
	root 'films#index'
	resources :films
	resources :starships
	resources :persons
	resources :planets
    get 'search/' => 'search#index'
    get '/search/:query' => 'search#index'

end
