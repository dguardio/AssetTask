Rails.application.routes.draw do
  devise_for :managers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	resources :houses
  	resources :commercial_units
  	resource :complex_buildings
	root 'welcome#index'

end
