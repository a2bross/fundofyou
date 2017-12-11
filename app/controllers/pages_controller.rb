class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @ongoing_projects = Project.where(status: 10).order(end_date: :desc).first(3)
    @completed_projects = Project.where("completion_rate >= 100").order(end_date: :desc).first(3)
    @project1 = Project.find(10)
    @project2 = Project.find(5)
    @project3 = Project.find(4)
    @project4 = Project.find(8)
    @project5 = Project.find(6)
    @project6 = Project.find(9)

  end

  def test
  end
end
