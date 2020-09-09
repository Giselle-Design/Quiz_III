Rails.application.routes.draw do

  get "/", to: "welcome#root", as: 'root'

  resources :auctions do
  resources :bids, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :auctions, only:[:create, :show, :index, :destroy]
      resource :session, only: [:create]
    end
  end
end
