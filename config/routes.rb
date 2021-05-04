Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  get '/beers', to: 'homes#index'

  namespace :api do
    namespace :v1 do
      resources :beers, only: [:index]
    end
  end
end
