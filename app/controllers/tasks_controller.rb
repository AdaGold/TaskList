class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # @tasks.each do |task|
    #   task.completed = task.completed_at != nil
    #   task.save
    # end
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
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    @task.title = params[:task][:title]
    @task.description= params[:task][:description]

    @task.save

    redirect_to action: "show"

  end

  def button
    @task = Task.find(params[:id])
    @task.toggle!(:completed)

    if @task.completed
      @task.completed_at = Time.now
    else
      @task.completed_at = nil
    end

    @task.save

    redirect_to(:back)

  end


  # This was for toggle... revisit later
    # def toggle_approve
    #   @a = Tasks.find(params[:id])
    #   @a.toggle!(:completed)
    #   render :nothing => true
    # end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to action: "index"
  end


end
