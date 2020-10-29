

#Controller actions are always methods
class TasksController < ApplicationController
  def index # Index will list all
    @tasks = Task.all
  end
end
