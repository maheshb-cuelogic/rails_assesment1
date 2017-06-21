Rails.application.routes.draw do
  root :to => "home#index"


  namespace :api do
    namespace :v1 do
      get 'restaurants' => 'restaurants#index', defaults: {format: 'json'}
    end
  end


end
