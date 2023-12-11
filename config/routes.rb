Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
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
   resources :restaurants

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
