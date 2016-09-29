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
  end

  def edit
    show
  end

  def update
  end

  def create
    @params = params
    @mytask = Task.new
    @mytask.task_name = params[:task_name]
    @mytask.description = params[:description]
    @mytask.completion_status = "incomplete"
    # @mytask.completeion_date = Time.new
    @mytask.save
  end

  def self.alltasks
    [
      {id: 1, thing: "Make Soup", description: "Put veggies in water...boil", completion_status: "incomplete", completeion_date: "N/A"},

      {id: 2, thing: "Bake a party cake", description: "You know the drill", completion_status: "incomplete", completeion_date: "N/A"},

      {id: 3, thing: "Dance", description: "OOh, la la la, la la, la la la", completion_status: "incomplete", completeion_date: "N/A"}

    ]
  end

  private
  def user_params
    params.require(:task).permit(:task_name, :description, :completion_status, :completeion_date)
  end

end
