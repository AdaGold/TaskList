Rails.application.routes.draw do
  root 'sessions#login'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/login', to: 'sessions#login', as: "login"
  get '/sessions/login_failure', to: 'sessions#login_failure', as: 'login_failure'
  delete '/sessions', to: 'sessions#destroy', as: "sessions_delete"

  get 'tasks' => 'tasks#index'
  get 'tasks/new' => 'tasks#new'
  post 'tasks' => 'tasks#create'
  get 'tasks/:id/edit', to: 'tasks#edit', as: 'task_edit'
  patch 'tasks/:id' => 'tasks#update'
  get 'tasks/:id', to: 'tasks#show', as: 'task'
  patch 'tasks/:id/record_completion', to: 'tasks#record_completion', as: 'task_record_completion'
  delete 'tasks/:id' => 'tasks#destroy'
end
