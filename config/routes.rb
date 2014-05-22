Rails.application.routes.draw do
  resources :series

  root 'courses#index'

  resources :hours

  resources :admins, only: [:index]

  resources :sessions, only: [:new, :create, :destroy]

  resources :teaching_assistants, only: [:index, :show]

  resources :statuses, only: [:index, :show]

  resources :courses

  get '/sign_ups/:private_id', to: 'sign_ups#show'
end
