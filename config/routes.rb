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
      resources :beers, only: [:our_beers, :external_beers, :show] do
        resources :reviews, only: [:index, :create, :destroy]
      end
      resources :external_beers, only: [:index, :show]
    end
  end
end
