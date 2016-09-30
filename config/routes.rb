Rails.application.routes.draw do
  # these are solely string data that rails seeks a matches for
  # goal is human readablity

  root to: 'tasks#index'
  # root does not need a hash rocket!
  # <- this replaces  this get '/' # this is my index
  get 'tasks/index', as: 'index'

  get 'tasks/show'
  get 'tasks/:id/show' => 'tasks#show', as: 'show'

  post 'tasks/create' => 'post#create', as: 'create'

  get 'tasks/new' => 'tasks#new', as: 'new'

  get 'tasks/:id/edit' => 'tasks#edit', as: 'edit'

  patch 'tasks/:id/completed_at' => 'tasks#completed_at', as: 'completed_at'
  
  delete 'tasks/:id/destroy' => 'tasks#destroy', as: 'destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# do not put 'tasks/' before the action