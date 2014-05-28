Rails.application.routes.draw do
  root 'courses#index'

  resources :series

  resources :hours

  resources :courses

  resources :teaching_assistants

  resources :sessions, only: [:new, :create, :destroy]

  resources :statuses, only: [:index, :show]

  get '/sign_ups/:private_id', to: 'sign_ups#show', as: 'sign_ups'
  get '/admins/dashboard', to: 'admins#dashboard', as: 'admins_dashboard'
  get '/admins/emails', to: 'admins#emails', as: 'admins_emails'
end
