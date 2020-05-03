class TasksController < ApplicationController
  TASKS = [
    { name: "W1 Rails Lectures", description: "Watch lectures 2x the speed."},
    { name: "Meal prep", description: "Cooking meals so I can run and code well."},
    { name: "Decompress", description: "Spend time away from computer screen."}
  ]

  def index
    @tasks = TASKS
  end

  def show
  end
end
