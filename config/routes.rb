Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"

  
  # get 'search', to: 'homes#search'

  # get '', to: 'search#search', as: 'search'

  resources :homes, only: [:index] do
    collection do
      get 'filter'
      get 'select_location'
    end
  end

  devise_scope :user do
    get "user/profile" => "users#profile",as: "profile_user"
  end

  resources :users do
    resources :addresses
  end
  get '/search', to: 'restaurants#search', as: 'search_restaurants'

  resources :restaurants do 
    collection do
      get 'search'
      get 'suggestions'
      get 'search_by_restaurents'
      get 'search_by_dish'
    end
  end

  resources :cart_items do
    member do 
      post :increment
      post :decrement
    end
  end

  resources :orders do
  end

  resources :order_items do
  end


end
