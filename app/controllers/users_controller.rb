class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :edit_criteria, :update_criteria, :result]

  def show
    # list all projects
    @projects = Project.all.order(:name)

    @markers = @projects.where.not(latitude: nil, longitude: nil).map do |project|
      {
        lat: project.latitude,
        lng: project.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def edit_criteria
  end

  def update_criteria
    @user.reset_criteria
    if params[:scope]
      @user.update(params[:scope] => 1) unless (params[:scope] == "no-scope")
    end
    if @user.update(criteria_params)
      redirect_to :result
    else
      redirect_to :edit_criteria
    end
  end

  def result
    # methode qui calcule les projets reco de current_user
    @recommendations = Project.recommendation(current_user, 3)
    @projects = []
    @recommendations.each do |reco|
      @projects << Project.find(reco[:project_id])
    end
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
    authorize @user
  end
end
