

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
    @task = Task.new(  #Is this working and saving into the database?
        name: params[:task][:name],
        description: params[:task][:description],
        completed_at: params[:task][:completed_at]
    )
    if @task.save # save returns true if the database insert succeeds
      redirect_to task_path(@task.id)
      return
    else # save failed :(
      render :new # show the new form view again
      return
    end
  end

  def edit
    @task =Task.find_by(id:params[:id])

    if @task.nil?
      redirect_to root_path
      return
    end
  end

  def update
    task_id = params[:id]
    @task = Task.find_by(id: task_id)
    if @task.nil?
      redirect_to tasks_path
      return
    elsif @task.update(
        name: params[:task][:name],
        description: params[:task][:description],
        completed_at: params[:task][:completed_at]
    )
    redirect_to root_path
    return
  else
    render :edit
    return
    end
  end


  def destroy
    task_id = params[:id]
    @task = Task.find_by(id:task_id)

    if @task.nil?
      redirect_to tasks_path
      return
    else
      @task.destroy
      redirect_to tasks_path
    end

  end

  def completed_at

    task_id = params[:id]
    @task =Task.find_by(id:task_id)

    if @task.completed_at.nil?
      head :not_found
      return
    elsif
    @task.update(completed_at: Time.now.to_s)
      redirect_to root_path
      return
    else
      @task.update(completed_at: nil)
      redirect_to tasks_path
      return
      end
  end
end
