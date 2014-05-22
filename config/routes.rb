Rails.application.routes.draw do
  root 'courses#index'

  resources :hours

  resources :admins, only: [:index]

  resources :teaching_assistants, only: [:index, :show]

  resources :statuses, only: [:index, :show]

  resources :courses
end
