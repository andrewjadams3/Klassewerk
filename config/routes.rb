Rails.application.routes.draw do
  root to: 'home#index'
  match '/welcome', to: 'home#welcome', via: 'get'

  namespace :temp do
    get '/upload' => '/upload#index'
    post '/upload' => '/upload#upload'
  end

  namespace :auth do
    resources :teachers, only: [:new, :create]
    resources :students, only: [:new, :create]

    match '/teacher_signup', to: 'teachers#new', via: 'get'
    match '/student_signup', to: 'students#new', via: 'get'

    match '/teacher_login', to: 'sessions#new_teacher', via: 'get'
    match '/student_login', to: 'sessions#new_student', via: 'get'

    match '/teacher_login', to: 'sessions#create_teacher', via: 'post'
    match '/student_login', to: 'sessions#create_student', via: 'post'

    match '/logout', to: 'sessions#destroy', via: 'delete'
  end

  namespace :api do
    namespace :v1 do
      resources :teachers, only: [:index, :show]
      resources :students, only: [:index, :show]
    end
  end

  get '*path', to: 'home#index'
end