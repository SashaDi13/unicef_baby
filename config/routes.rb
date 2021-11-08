Rails.application.routes.draw do
  root to: 'static_pages#main'
  get 'about', to: 'static_pages#about'
  # get 'advises', to: 'static_pages#advises'
  get 'contact', to: 'static_pages#contact'

  # get '/categories/:name', to: 'categories#show'

  resources :articles, only: [:index, :show]

  resources :categories, only: [:index, :show], path: 'advises' do
    resources :articles, only: [:index, :show]
  end
end
