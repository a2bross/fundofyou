class DonationsController < ApplicationController

  # def create
  #   @user = current_user
  #   @recommendations = Project.recommendation(@user, 3) # for redirection purpose only
  #   @project1 = Project.find(1)
  #   @project2 = Project.find(2)
  #   @project_nb = 2
  #   @order = Order.new(amount: params[:amount], status: 1)
  #   # TO DO add condition on number of selected project
  #   if @order.save
  #     @donation1 = Donation.new(project: @project1, user: @user, order: @order, amount: @order.amount.fdiv(@project_nb), status: 1)
  #     @donation2 = Donation.new(project: @project2, user: @user, order: @order, amount: @order.amount.fdiv(@project_nb), status: 1)
  #     if @donation1.save && @donation2.save
  #       redirect_to new_order_payment_path(@order)
  #     else
  #       flash[:alert] = "Error when saving new donations"
  #       render 'users/result'
  #     end
  #   else
  #     flash[:alert] = "Error when saving new order"
  #     render 'users/result'
  #   end
  # end

  # private

  # def donation_params
  # end
end
