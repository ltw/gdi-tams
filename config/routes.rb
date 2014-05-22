Rails.application.routes.draw do
  root 'courses#index'

  resources :hours

  resources :admins, only: [:index]

  resources :teaching_assistants, only: [:index, :show]
  get '/ta/:private_id', to: 'teaching_assistants#private'

  resources :statuses, only: [:index, :show]

  resources :courses
end
