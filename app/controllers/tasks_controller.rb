class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @mytask = Task.new
  end

  def show
    @mytask = Task.find(params[:id].to_i)
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
    @mytask.task_name = params[:task_name]
    @mytask.description = params[:description]
    @mytask.save

    redirect_to action: "index"
  end

  def create
    @params = params
    @mytask = Task.new
    @mytask.task_name = params[:task_name]
    @mytask.description = params[:description]
    @mytask.completion_status = "incomplete"
    @mytask.completion_date = "Not completed yet!"
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
    params.require(:task).permit(:task_name, :description, :completion_status, :completeion_date)
  end

end
