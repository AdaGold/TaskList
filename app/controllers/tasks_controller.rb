class TasksController < ApplicationController
  def index
    @tasks = TasksController.alltasks
  end

  def new
  end

  def show
    @tasks = TasksController.alltasks
    @mytask = nil

    @tasks.each do |task|
      number = params[:id].to_i
      if task[:id] == number
        @mytask = task
      end
    end

    if @mytask == nil
      @mytask = {id: params[:id].to_i, thing: "Did not find", description: "", completion_status: "unknown", completeion_date: "N/A" }
    end
  end

  def delete
  end

  def edit
  end

  def update
  end

  def create
  end

  def self.alltasks
    [
      {id: 1, thing: "Make Soup", description: "Put veggies in water...boil", completion_status: "incomplete", completeion_date: "N/A"},

      {id: 2, thing: "Bake a party cake", description: "You know the drill", completion_status: "incomplete", completeion_date: "N/A"},

      {id: 3, thing: "Dance", description: "OOh, la la la, la la, la la la", completion_status: "incomplete", completeion_date: "N/A"}

    ]
  end

end
