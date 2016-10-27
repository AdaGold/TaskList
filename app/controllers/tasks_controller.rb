class TasksController < ApplicationController
  def index
    if @mytask.user_id != session[:user_id]
      flash[:notice] = "You cannot view a task list that is not your own."
      redirect_to homepage_path
    end
    @tasks = Task.where(user_id: session[:user_id])
    @user = User.find(session[:user_id])
  end

  def new
    @mytask = Task.new
  end

  def show
    @mytask = Task.find(params[:id].to_i)
    if @mytask.user_id != session[:user_id]
      flash[:notice] = "You cannot view or edit tasks that are not your own."
      redirect_to homepage_path
    end
  end

  def delete
    @mytask = Task.destroy(params[:id].to_i)

    redirect_to action: "index"
  end

  def edit
    show
  end

  def update
    @mytask = Task.find(params[:id].to_i)
    @params = params
    @mytask.task_name = params[:task][:task_name]
    @mytask.description = params[:task][:description]
    @mytask.save

    redirect_to action: "index"
  end

  def create
    if session[:user_id] = nil
      flash[:notice] = "You must be logged in to create a task."
      redirect_to homepage_path
    end
    @params = params
    @mytask = Task.new
    @mytask.task_name = params[:task][:task_name]
    @mytask.description = params[:task][:description]
    @mytask.completion_status = "incomplete"
    @mytask.completion_date = "Not completed yet!"
    @mytask.user_id = session[:user_id]
    @mytask.save

    redirect_to action: "index"
  end

  def mark_complete
    @mytask = Task.find(params[:id].to_i)
    @mytask.completion_status = "complete"
    @mytask.completion_date = DateTime.now
    @mytask.save

# <li><%= link_to_unless_current("About Us", { action: "about" }) %></li>
    redirect_to action: "index"
  end

  def mark_incomplete
    @mytask = Task.find(params[:id].to_i)
    @mytask.completion_status = "incomplete"
    @mytask.completion_date = "Not completed yet!"
    @mytask.save

    redirect_to action: "index"
  end

  private
  def user_params
    params.require(:task).permit(:task_name, :description, :completion_status, :completion_date)
  end

end
