Rails.application.routes.draw do
  # match "demo/index", :to => "demo#index", :via => :get

  root 'static_pages#home'

  # sessions
  get 'sessions/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # user management
  get '/signup', to: 'users#new'
  get 'password_resets/new'
  get 'password_resets/edit'

  #static pages
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  # Users and sessions
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  # Umweltdenker Application
  resources :contributions, only: [:new, :create, :destroy, :index, :show]
  resources :groups, only: [:index]
  resources :categories, only: [:index]
  get '/new_contribution', to: 'contributions#new'  # why do I have to manually create that?

  # challenges
  resources :challenges, only: [:index]
end