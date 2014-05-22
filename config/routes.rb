Rails.application.routes.draw do
  root 'courses#index'

  resources :series

  resources :hours

  resources :courses

  resources :admins, only: [:index]

  resources :sessions, only: [:new, :create, :destroy]

  resources :teaching_assistants, only: [:index, :show]

  resources :statuses, only: [:index, :show]

  get '/sign_ups/:private_id', to: 'sign_ups#show', as: 'sign_ups'
  get '/admins/dashboard', to: 'admins#dashboard', as: 'admins_dashboard'
end
