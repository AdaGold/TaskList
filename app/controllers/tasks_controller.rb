class TasksController < ApplicationController

  def index
    @tasks = Task.all
    #consider adding @tasks = Task.where(done:false)
    #consider adding @tasks_done = Task.where(done:true)
  end

  #opens new form for user submits to create
  def new
    @task = Task.new
  end

  def create
    @task = Task.new

    @params = params #parameters submitted from form (a hash) which is automated by rails
    @task.title = params[:title]
    @task.description = params[:description]
    @task.completed_at = params[:completed_at]
    @task.created_at = params[:created_at]
    @task.updated_at = params[:updated_at]
    @task.save
  end
  
  #opens new form for user submits to update

  def edit  
    @task = Task.new.find(params[:id].to_i)
  end

  def update

    self.show
      @task.title = params[:title]
      @task.description = params[:description]
      @task.completed_at = params[:completed_at]
      @task.created_at = params[:created_at]
      @task.updated_at = params[:updated_at]
  end

  def delete
    @task =Task.find(params[:id])
    @task.destroy
  end

  def show
    @task = Task.find(params[:id].to_i)
  end
end
