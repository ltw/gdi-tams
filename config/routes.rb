require 'resque/server'

Rails.application.routes.draw do
  root 'courses#index'

  resources :series, only: [:new, :create]

  resources :hours

  resources :courses, only: [:new, :create]
  get '/courses/:id/ta_list', to: 'courses#ta_list', as: 'course_ta_list'

  resources :teaching_assistants #, param: :private_id

  resources :sessions, only: [:new, :create, :destroy]

  resources :statuses, only: [:index, :show]

  # SHOULD BE DELETED AND MOVED UNDER TEACHING ASSISTANTS
  get '/sign_ups/forgot', to: 'sign_ups#forgot', as: 'forgot_sign_ups'
  get '/sign_ups/:private_id', to: 'sign_ups#show', as: 'sign_ups'

  # PRIMARY ADMIN DASHBOARD
  get '/dashboard', to: 'admins#dashboard', as: 'admins_dashboard'

  # EMAIL SENDS
  get '/emails/welcome', to: 'emails#welcome', as: 'welcome_emails'
  get '/emails/monthly', to: 'emails#monthly', as: 'monthly_emails'
  get '/emails/confirmation', to: 'emails#confirmation', as: 'confirmation_emails'
  get '/emails/forgot', to: 'emails#forgot', as: 'forgot_emails'

  mount Resque::Server.new, :at => "/resque"
end
