class ProjectsController < ApplicationController
  def index
    # list all projects
    @projects = Project.all
  end

  def new
    # new project
    @project = Project.new(project_params)
    @project.save
    redirect to project_path(@project)
  end

  def create
    # create a project
    @project = Project.new(project_params)
    @project.save
    redirect to project_path(@project)
  end

  def show
    # show a project
    @project = Project.find(params[:id])
  end

  def edit
    # edit a project
  end

  def update
    # update a project
  end

  def destroy
    # destroy a project
    @project = Project.find(params[:id])
    @project.destroy
    redirect to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

end




