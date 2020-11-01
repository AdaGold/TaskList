Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  #Routes that have to do with the collection of tasks

  get '/tasks', to: 'tasks#index', as: 'tasks' #lists all tasks
  get 'tasks/new',to: 'tasks#new' , as: 'new_task' #gets a form for new task
  post '/tasks', to: 'tasks#create' # creates new task

  #Routes that deal with a specific task
  get '/tasks/:id', to: 'tasks#show', as: 'task' #shows specific task
  get '/tasks/:id/edit', to: "tasks#edit", as: 'edit_task' #brings up form to edit task
  patch '/tasks/:id', to: 'tasks#update' #updates an existing task
  delete 'tasks/:id', to: 'tasks#destroy', as: 'delete_task'#Destroy given task
end
