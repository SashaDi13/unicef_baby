Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root to: 'static_pages#main'
  get 'about', to: 'static_pages#about'
  # get 'advises', to: 'static_pages#advises'
  get 'contact', to: 'static_pages#contact'

  # get '/categories/:name', to: 'categories#show'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    omniauth_callbacks: 'admins/omniauth_callbacks'
  }

  resources :articles, only: :index do
    get 'download_images', on: :collection, defaults: { format: 'zip' }
  end

  resources :articles, except: [:show, :update]

  resources :categories, only: [:index, :show], path: 'advises' do
    resources :articles, only: [:show, :edit, :destroy, :update]
  end
end
