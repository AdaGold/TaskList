class TasksController < ApplicationController
  before_action :find_tasks, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @current_user.tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]
    if @task.save
      redirect_to tasks_path(@task)
    else
      render :new
    end
  end

  def edit
  end

  def update #like create, but for editing
    @task.assign_attributes(task_params)
    if @task.save
      redirect_to tasks_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def record_completion
    @task = Task.find(params[:id][:completion]).Datetime.now
    @task.update(task_params[:id][:completion])
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completion)
  end

  def find_tasks
      begin
        @tasks = @current_user.tasks.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render file: "public/404", status: :not_found
      end
  end
end
