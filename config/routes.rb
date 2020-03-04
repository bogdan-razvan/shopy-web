# frozen_string_literal: true

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' # monitoring console
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
