class DonationsController < ApplicationController

  def create
    # TODO : check for competitor donations and cancelled them
    # TODO : créer une ou plusieurs donations
    @user = current_user
    @project = Project.new(name: "coucou")
    @donation = Donation.new
    if @donation.save
      redirect_to user_path(@user)
    else
      render 'users/result'
    end
  end

  private

  def donation_params
  end
end
