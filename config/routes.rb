require 'resque/server'

Rails.application.routes.draw do
  root 'courses#index'

  resources :series, only: [:new, :create]

  resources :hours, only: [:new, :edit, :create, :update, :destroy]

  resources :courses, only: [:new, :create]
  get '/courses/:id/ta_list', to: 'courses#ta_list', as: 'course_ta_list'

  resources :teaching_assistants, param: :private_id, only: [:index, :new, :create, :show, :update]
  get '/teaching_assistants/thanks', to: 'teaching_assistants#thanks', as: 'teaching_assistant_thanks'

  resources :sessions, only: [:new, :create, :destroy]

  # PRIMARY ADMIN DASHBOARD
  get '/dashboard', to: 'admins#dashboard', as: 'admins_dashboard'

  # EMAIL SENDS
  get '/emails/welcome', to: 'emails#welcome', as: 'welcome_emails'
  get '/emails/monthly', to: 'emails#monthly', as: 'monthly_emails'
  get '/emails/confirmation', to: 'emails#confirmation', as: 'confirmation_emails'

  mount Resque::Server.new, :at => "/resque"
end
