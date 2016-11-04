

class TasksController < ApplicationController
  before_action :require_user
  before_action :find_task, except: [:index, :create, :new]

  def index
    @tasks = Task.where(user_id: session[:user_id].to_i)
  end

  def create
    @params = params
    @mytask = Task.create
    @mytask.user_id = session[:user_id].to_i
    @mytask.title = params["task"]["title"]
    @mytask.description = params["task"]["description"]
    @mytask.details = params["task"]["details"]
    @mytask.completion_status = params["task"]["completion_status"]
    @mytask.completion_date = params["task"]["completion_date"]
    @mytask.save
    redirect_to index_path
  end


  def new
    @mytask = Task.new
  end

  def show

  end

  def destroy

    @mytask.destroy
    @destroy_msg = "Task Successfully Deleted"
  end

  def edit

  end

  def update
    # @params = params
    @mytask.user_id = params["task"]["user_id"].to_i
    @mytask.title = params["task"]["title"]
    @mytask.description = params["task"]["description"]
    @mytask.details = params["task"]["details"]
    @mytask.completion_status = params["task"]["completion_status"]
    @mytask.completion_date = params["task"]["completion_date"]
    @mytask.save
    redirect_to index_path
  end

  def mark_complete

    @mytask.completion_status = "true"
    @mytask.completion_date = Time.now
    @mytask.save
    redirect_to index_path
  end

  #
  # def self.allposts
  #   [
  #     {id: 1, title: "pay bills", description: "financial task", details: "T-Mobil due", completion_status: false, completion_date: nil}, {id: 2, title: "dentist appointment", description: "wellness task", details: "Malika needs check-up", completion_status: true, completion_date: "09/15/2016"}, {id: 3, title: "call pharmacy", description: "wellness task", details: "check status of humera", completion_status: false, completion_date: nil}
  #   ]
  # end

  private
  def user_params
    params.require(:task).permit(:title, :description, :completion_status, :completion_date)
  end

  def find_task
    @mytask = Task.find(params[:id].to_i)
  end

  def find_user
    @user = User.find_by(id: session[:user_id].to_i)
  end

end
