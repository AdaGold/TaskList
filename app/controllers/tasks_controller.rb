class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :record_completion, :destroy]

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
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def record_completion
    @task.completion = Datetime.now
    @task.save
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completion)
  end

  def find_task
    begin
      @task = @current_user.tasks.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render file: "public/404", status: :not_found
    end
  end
end
