Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root path
  root :to => 'tasks#index'

  # route for task index page
  get '/tasks', to: 'tasks#index', as: 'tasks'

  # new task
  get '/tasks/new', to: 'tasks#new', as:'new_task'
  post '/tasks', to: 'tasks#create'

  # show all tasks, note to future Diana: order is important -_-
  # look over RESTful routes Ada lesson again!
  # stack overflow explanation: https://stackoverflow.com/questions/32145501/why-does-order-matter-in-rails-routes-rb-when-using-resources
  get '/tasks/:id', to: 'tasks#show', as: 'task'
  get 'tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch 'tasks/:id', to: 'tasks#update'
end
