class SessionController < Devise::SessionController
  def index
  end

  def new
    #this function will go to sign in page
    @user = User.new
  end

  def create
    super
  end

  def destroy
    super
  end
end