# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options host: 'example.com'

  resources :products
  use_doorkeeper
  mount Sidekiq::Web => '/sidekiq' # monitoring console
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  use_doorkeeper scope: 'api/v1/sessions' do
    skip_controllers :applications, :authorizations, :authorized_applications, :token_info
  end

  namespace :api do
    namespace :v1 do
      resources :members, only: :create

      resources :sessions, only: %i[create index] do
        delete '/', action: :destroy, on: :collection
      end

      resources :products, only: %i[index show]
      resources :reviews, only: %i[create]
      resources :avatars, only: %i[create]
      resources :order_items, only: %i[index create update destroy]
      resources :orders, only: %i[index create]
    end
  end
end
