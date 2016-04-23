class PeopleController < ApplicationController
  def index
    @all_people = Person.order(id: :asc)
    render :index
  end

  def show
    @person = Person.find(params[:id])
    render :show
  end

  def tasks
    @person = Person.find(params[:id])
    @tasks = @person.tasks
  end
end
