

#Controller actions are always methods
class TasksController < ApplicationController
  def index # Index will list all
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id:task_id)
    if @task.nil?
      head 300
      return
    end
  end

  def new
    @task =Task.new
  end

  def create
    @task = Task.new(name: params[:task][:name],description: params[:task][:description]) #
    if @task.save # save returns true if the database insert succeeds
      redirect_to task_path(@task.id)
      return
    else # save failed :(
      render :new # show the new form view again
      return
    end
  end
end
