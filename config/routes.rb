Rails.application.routes.draw do
  root 'courses#index'

  resources :hours

  resources :admins, only: [:index]

  resources :teaching_assistants, only: [:index, :show]

  get '/sign_ups/:private_id', to: 'sign_ups#show'

  resources :statuses, only: [:index, :show]

  resources :courses
end
