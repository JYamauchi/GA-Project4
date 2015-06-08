class UsersController < ApplicationController
  
  def index
  
  end

  def new
    @user = User.new
  end

  def create
    #create your process here for what you want to do when people signing up
  end

  def edit
    #create your process here for edit user data page
  end

  def update
    #create your process here for what you want to do when people editing their data
  end

  def destroy
    #this function is used for deleting user data
  end
end
