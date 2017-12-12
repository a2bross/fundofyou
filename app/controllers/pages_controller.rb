class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @ongoing_projects = Project.where(status: 10).order(end_date: :desc).first(3)
    @completed_projects = Project.where("completion_rate >= 100").order(end_date: :desc).first(3)
  end

  def test
  end
end
