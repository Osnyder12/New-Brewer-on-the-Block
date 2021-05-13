Rails.application.routes.draw do
  root 'beers#index'
  devise_for :users

  get '/beers', to: 'homes#index'
  get '/beers/:id', to: 'homes#index'
  get '/beers/new', to: 'homes#index'
  get '/punk_beers', to: 'homes#index'
  get '/punk_beers/:id', to: 'homes#index'

  namespace :api do
    namespace :v1 do
      resources :beers, only: [:index, :show, :create, :new] do
          resources :reviews, only: [:index, :create, :destroy]
      end
      resources :punk_beers, only: [:index, :show] do
        resources :punk_reviews, only: [:index, :create, :destroy]
      end
      resources :beers, only: [:index] do
        resources :ingredients, only: [:create, :new]
      end
    end
  end
end
