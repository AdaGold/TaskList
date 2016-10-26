class HomepagesController < ApplicationController
  def index
    if session[:user_id] != nil
      redirect_to index_path
    end
  end
end
