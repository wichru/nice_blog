Rails.application.routes.draw do
  root 'welcome#index'

  get 'articles', to: 'articles#index'
end
