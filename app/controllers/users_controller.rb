class UsersController < ApplicationController

#Dashboard
  def show
    @user = User.find(params[:id])
  end
end

