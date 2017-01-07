Rails.application.routes.draw do
  root :to => "home#index"

  resources :restaurants, only: :create
  namespace :api do
    namespace :v1 do
      resources :restaurants, only: :index, defaults: {format: 'json'}      
    end
  end  
end
