
TASKS = [ "Do laundry", "Grocery Shopping", "Go to the gym"]


class TasksController < ApplicationController
  def index
    @tasks = TASKS
    @tasks = Task.all
  end
end
