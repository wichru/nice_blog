Rails.application.routes.draw do
  root 'welcome#index'

  get 'articles', to: 'articles#index'
  get 'articles/new', to: 'articles#new', as: 'new_article'
  post 'articles', to: 'articles#create'
end
