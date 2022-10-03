Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  


  
  get '/pages/home', to: 'pages#home'

  resources :users
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :projects
  resources :bugs
 


 
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
