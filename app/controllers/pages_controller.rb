class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_authorized

  def home

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
