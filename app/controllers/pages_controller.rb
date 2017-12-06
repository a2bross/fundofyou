class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @project1 = Project.find(1)
  end
end
