
TASKS = [
    { name: "Do Laundry", description: "Put dirty laundry into the washer", completed_at: "10/27/2020"},
    { name: "Grocery shopping", description: "Go to Freddies to get groceries items", completed_at:"10/31/2020"}
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
