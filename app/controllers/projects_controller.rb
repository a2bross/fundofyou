class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]

  def index
    # list all active projects
    @projects = policy_scope(Project).where(status: 10).order(end_date: :desc)
  end

  def new
    # new project
    @project = Project.new
    authorize @project
  end

  def create
    # create a project
    @project = Project.new(project_params)
    authorize @project
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    # show a project
  end

  def edit
    # edit a project
  end

  def update
    # update a project
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    # destroy a project
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :contact_name, :address,
      :start_date, :end_date, :charity_id, :status, :budget, :environment, :humanitarian,
      :social, :preservation, :research, :local, :abroad, :urgency, :education,
      :completion_rate, :photo)
  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

end

