Rails.application.routes.draw do
  root to: 'home#index'

  namespace :temp do
    get '/upload' => '/upload#index'
    post '/upload' => '/upload#upload'
  end

  namespace :api do
    namespace :v1 do
      resources :teachers, only: [:index, :show, :create]
      resources :students, only: [:index, :show, :create]
      resources :schools, only: [:index, :show]
    end
  end

  get '*path', to: 'home#index'
end
