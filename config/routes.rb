Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root path
  root :to => 'tasks#index'

  # route for task index page
  get '/tasks', to: 'tasks#index', as: 'tasks'

  # show all tasks
  get '/tasks/:id', to: 'tasks#show', as: 'task'

end
