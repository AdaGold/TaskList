

#Controller actions are always methods
class TasksController < ApplicationController
  def index # Index will list all
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id:task_id)
    if @task.nil?
      head :not_found
      return
    end
  end

  def new
    @task =Task.new
  end

end
