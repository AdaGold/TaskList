class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  #opens new form for user submits to create
  def new
    
    @task = Task.new

  end

  def create
    self.new
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
    self.show
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
    num = params[:id].to_i
    Post.find(num).destroy
  end

  def show
    @task = Task.find(params[:id].to_i)
  end
end
