class PeopleController < ApplicationController
  def index
    @all_people = Person.order(id: :asc)
  end

  def show
    @person = Person.find(params[:id])
    render :show
  end
end
