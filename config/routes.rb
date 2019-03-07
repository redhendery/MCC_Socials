Rails.application.routes.draw do
  root 'static_pages#home'

# Static Routes
  get '/about', to: 'static_pages#about'
  # get '/contact', to: 'static_pages#contact'
  get '/sponsors', to: 'static_pages#sponsors'

# Login, Logout and Signup Routes
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :contact, only: [:index, :new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
