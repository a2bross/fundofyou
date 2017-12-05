class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :edit_criteria, :update_criteria, :result]

  def show
  end

  def edit_criteria
  end

  def update_criteria
    if @user.update(criteria_params)
      redirect_to :result
    else
      render :edit_criteria
    end
  end

  def result
    # methode qui calcule les projets reco de current_user
    @project = Project.new(name: "Super projet")
  end

  private

  def criteria_params
    params.require(:user).permit(:first_name)
  end

  def set_user
    @user = current_user
  end
end
