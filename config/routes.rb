Rails.application.routes.draw do
  resources :pages
  resources :reviews do
   member do
    put "like", to: "reviews#upvote"
    put "dislike", to: "reviews#downvote"
   end
  end
  
  resources :reviews do 
    resources :companies
  end 
  
  devise_for :users
  resources :users, only: [:show]
  resources :companies do 
  	resources :reviews
  	 collection do 
  	 	get :search #creates new path for the search input
  	 end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'companies#index'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
