# frozen_string_literal: true

Rails.application.routes.draw do
  resources :meetings do
    member do
      put 'agree'
      get 'agree'
    end
  end

  get 'sessions/landingpage'
  root 'sessions#landingpage'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
