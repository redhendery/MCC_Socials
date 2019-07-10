Rails.application.routes.draw do
  root 'static_pages#home'

# Static Routes
  get '/about', to: 'static_pages#about'
  get '/ashes', to: 'static_pages#ashes'
  get '/sponsors', to: 'static_pages#sponsors'
  get '/nyl-2019', to: 'static_pages#newyorklife'
  get '/membership', to: 'static_pages#membership'
# Login, Logout and Signup Routes
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, path: '/players' do
    member do
      put :paid, :admin, :remove_admin
    end
  end

  resources :schedules do
    collection do
      get :socials, :firsts, :seconds
    end
    member do
      get :available, :unavailable
    end
  end

  resources :account_activations, only: [:edit]
  resources :contact, only: [:index, :new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
