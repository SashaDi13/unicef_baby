Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount Ckeditor::Engine => '/ckeditor'

  namespace :api do
    namespace :v1 do
      resources :categories, only: :show
    end
  end

  root to: 'static_pages#main'
  get 'about', to: 'static_pages#about'
  # get 'advises', to: 'static_pages#advises'
  get 'contact', to: 'static_pages#contact'

  # get '/categories/:name', to: 'categories#show'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    omniauth_callbacks: 'admins/omniauth_callbacks'
  }

  devise_scope :admin do
    get 'sign_in', to: 'devise/sessions#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end

  resources :articles, only: :index do
    get 'download_images', on: :collection, defaults: { format: 'zip' }
  end

  resources :articles, except: [:show, :update]
  resources :documents

  resources :categories, only: [:index, :show], path: 'advises' do
    resources :articles, only: [:show, :edit, :destroy, :update]
  end
end
