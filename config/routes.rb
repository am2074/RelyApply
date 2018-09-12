Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  resources :companies do 
  	resources :reviews
  	 collection do 
  	 	get :search #creates new path for the search input
  	 end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'companies#index'
end
