Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'cars', to: 'cars#all_cars'
      get 'users/login', to: 'users#login'
      resources :users, except: [:new] do
        resources :cars
        resources :reservations
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
