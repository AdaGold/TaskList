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
    @all_people = Person.all
  end

  def create #COMMON PATTERN FOR CREATE
    # check_hash = task_create_params[:task]
    # if check_hash[:completed_at] != nil
    #   check_hash[:completed_at] = DateTime.now
    # end
    @task = Task.new(task_create_params[:task])
    if(@task.save)
      redirect_to task_path(@task.id)#redirect in case user tries to post another form - brings them to entered view
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @all_people = Person.all
    render :edit
  end

  def update
    @task = Task.find(params[:id])
      if @task.update({:completed_at => nil}.merge(task_edit_params[:task]))
        redirect_to task_path(@task.id)#redirect in case user tries to post another form - brings them to entered view
      else
        render :edit
      end#redirect in case user tries to post another form - brings them to entered view
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  def complete
    task = Task.find(params[:id])
    if !task.completed
      task.update(completed_at: true, completed_at: DateTime.now)
    else
      task.update(completed_at: false, completed_at: nil)
    end
    redirect_to "/"
  end

  private

  def task_create_params#the params we want when we create a task, to sanitize and control user input
    params.permit(task: [:name, :description, :person_id, :completed_status, :completed_at])#these are the only parameters that can be passed from user.
  end

  def task_edit_params
    params.permit(task: [:name, :description, :person_id, :completed_status, :completed_at])
  end
end
