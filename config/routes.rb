require 'resque/server'

Rails.application.routes.draw do
  root 'courses#index'

  resources :series, only: [:new, :create]

  resources :hours

  resources :courses, only: [:new, :create]
  get '/courses/:id/ta_list', to: 'courses#ta_list', as: 'course_ta_list'

  resources :teaching_assistants, param: :private_id

  resources :sessions, only: [:new, :create, :destroy]

  resources :statuses, only: [:index, :show]

  # PRIMARY ADMIN DASHBOARD
  get '/dashboard', to: 'admins#dashboard', as: 'admins_dashboard'

  # EMAIL SENDS
  get '/emails/welcome', to: 'emails#welcome', as: 'welcome_emails'
  get '/emails/monthly', to: 'emails#monthly', as: 'monthly_emails'
  get '/emails/confirmation', to: 'emails#confirmation', as: 'confirmation_emails'

  mount Resque::Server.new, :at => "/resque"
end
