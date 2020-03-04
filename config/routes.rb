# frozen_string_literal: true

Rails.application.routes.draw do
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
    end
  end
end
