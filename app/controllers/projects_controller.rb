class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    # list all active projects
    @projects = policy_scope(Project).where('status = 10 OR status = 20').order(end_date: :desc)
  end

  def new
    # new project
    @project = Project.new
    authorize @project
  end

  def create
    # create a project
    items_attributes = params[:project].delete(:items)
    @project = Project.new(project_params)
    @project.charity = Charity.last # A MODIFIER AVANT CHAQUE DEMO
    @project.end_date = @project.start_date - params[:duration].to_i
    authorize @project
    if @project.save
      items_attributes.each do |item_attribute|
          item = @project.items.create(name: item_attribute[:name], budget: item_attribute[:budget]) unless item_attribute[:name] == ""
        end
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
      :completion_rate, :photo, :objectives, :items_attributes => [[:name, :budget]] )
  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

end

