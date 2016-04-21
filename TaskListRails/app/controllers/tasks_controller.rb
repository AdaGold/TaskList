class TasksController < ApplicationController
  def index
    @tasks = Task.order(id: :asc)
  end

  def show
    @task = Task.find(params[:id])
    render :show
  end

  def new
    @task = Task.new
  end

  def create #COMMON PATTERN FOR CREATE
  @task = Task.new(task_create_params[:task])
    if(@task.save)
    redirect_to root_path#redirect in case user tries to post another form - brings them to another view
    else
    render :new
    end
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  private

  def task_create_params#the params we want when we create a task, to sanitize and control user input
    params.permit(task: [:name, :description])#these are the only parameters that can be passed from user.
  end
end
