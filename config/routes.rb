Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homes#index"
  devise_scope :user do
    get "user/profile" => "users#profile",as: "profile_user"
  end
  resources :users do
    resources :addresses
  end

end
