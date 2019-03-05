Rails.application.routes.draw do
  root 'static_pages#home'

# Static Routes
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'

  resources :users
end
