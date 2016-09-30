class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    tasks = Task.all
    # Get the current task
    @task = tasks.find(params[:id])

  end

  def new
    @newtask = Task.new

  end

  def create
    @params = params
    @task = Task.new
    @task.title = params[:task][:title]
    @task.description = params[:task][:description]
    # @newtask.complete = false
    @task.save

    redirect_to action: "show", id: @task.id
    # render "show", id: @task.id
  end

  def edit
  end

  def update

    @task.update_attribute(@task.completed_at, Time.now)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to action: "index"
  end


end
