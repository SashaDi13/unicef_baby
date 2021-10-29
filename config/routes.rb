Rails.application.routes.draw do
  root to: 'static_pages#main'
  get 'about', to: 'static_pages#about'
  get 'advises', to: 'static_pages#advises'
  get 'contact', to: 'static_pages#contact'

  resources :articles
end
