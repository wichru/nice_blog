Rails.application.routes.draw do
  root 'welcome#index'

  resources :articles
  # zamiast resources może być
  # get 'articles', to: 'articles#index'
  # get 'articles/new', to: 'articles#new', as: 'new_article'
  # get 'articles/:id', to: 'articles#show', as: 'article'
  # get 'articles/:id/edit', to: 'articles#edit', as: :edit_article
  # post 'articles', to: 'articles#create'
  # patch 'articles/:id', to: 'articles#update'
  # delete 'articles/:id', to: 'articles#destroy'
end
