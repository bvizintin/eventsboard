class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.order(:email)
  end

<<<<<<< HEAD
=======

>>>>>>> admin_area
end
