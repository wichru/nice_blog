# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :articles do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end
end
