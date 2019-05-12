# frozen_string_literal: true

Rails.application.routes.draw do
  resources :meetings do
    member do
      get 'agree'
      get 'disagree'
      get 'abstain'
      put 'agree'
      put 'disagree'
      put 'abstain'
    end
  end
  resources :users, only: %i[index edit update]
  get 'sessions/landingpage'
  root 'sessions#landingpage'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
