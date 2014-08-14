Rails.application.routes.draw do
  root to: 'home#index'

  namespace :temp do
    get '/upload' => 'upload#index'
  end

  get '*path', to: 'home#index'
end
