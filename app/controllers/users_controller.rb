class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :edit_criteria, :update_criteria, :result]

  def show
  end

  def edit_criteria
  end

  def update_criteria
    @user.reset_criteria
    @user.update(params[:scope] => 1) unless params[:scope] == "no-scope"
    if @user.update(criteria_params)
      redirect_to :result
    else
      redirect_to :edit_criteria
    end
  end

  def result
    # methode qui calcule les projets reco de current_user
    @recommendations = Project.recommendation(current_user, 3)
  end

  private

  def criteria_params
    params.permit(:environment, :humanitarian, :social, :preservation, :education, :research, :local, :abroad)
  end

  # def projects_params
  #   params.require(:project).permit(:name, :budget_cents, :start_date, :end_date, :charity)
  # end

  def set_user
    @user = current_user
  end
end
