


class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    # raise
    # if omniauth credentials are not retrieved - try again:
    if auth_hash == nil
      flash[:notice] = "Login Failed, Please try again"
      return redirect_to root_path
    end

    @user = User.find_by(uid: auth_hash[:uid], provider: 'github')
    # if the user has not already been created in the database, create a new user:
    if @user == nil
      @user = User.build_from_github(auth_hash)
      return redirect_to root_path unless @user.save
    else
      session[:user_id] = @user.id

      return redirect_to users_edit_path(@user.id)
    end
    # save the user id in the session:
    session[:user_id] = @user.id
    # return
    redirect_to 'index'
  end

  # this is here becuase it was in the example and in betsy... but not sure that it is needed:
  def index
    @user = User.find(session[:user_id])
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You Have Logged Out"
    redirect_to root_path
  end

end
