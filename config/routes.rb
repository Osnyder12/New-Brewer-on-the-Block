Rails.application.routes.draw do
  root 'beers#index'
  devise_for :users

  resources :beers, only: [ :new, :edit, :create, :update, :destroy ]

  get '/beers', to: 'homes#index'
  get '/beers/:id', to: 'homes#index'
  get '/punk_beers', to: 'homes#index'
  get '/punk_beers/:id', to: 'homes#index'
  get '/search', to: 'beers#search'

  namespace :api do
    namespace :v1 do
      resources :beers, only: [:index, :show] do
        resources :reviews, only: [:index, :create, :destroy]
      end
      resources :punk_beers, only: [:index, :show] do
        resources :punk_reviews, only: [:index, :create, :destroy]
      end
    end
  end
end
