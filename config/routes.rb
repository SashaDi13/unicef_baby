Rails.application.routes.draw do
  root to: 'static_pages#main'
  get 'about', to: 'static_pages#about'
  # get 'advises', to: 'static_pages#advises'
  get 'contact', to: 'static_pages#contact'

  # get '/categories/:name', to: 'categories#show'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
end
