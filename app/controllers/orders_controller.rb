class OrdersController < ApplicationController

  def create
    @user = current_user
    @recommendations = Project.recommendation(@user, 3) # for redirection purpose only
    @selected_projects = []
    @selected_projects << Project.find(params[:project_1]) unless params[:project_1] == ""
    @selected_projects << Project.find(params[:project_2]) unless params[:project_2] == ""
    @selected_projects << Project.find(params[:project_3]) unless params[:project_3] == ""
    project_nb = @selected_projects.size
    @order = Order.new(amount: params[:contribution], status: 1)
    if @order.save
      @selected_projects.each do |project|
        Donation.create!(project: project, user: @user, order: @order, amount: @order.amount.div(project_nb), status: 1)
      end
      if @order.donations.size == project_nb
        redirect_to new_order_payment_path(@order)
      else
        flash[:alert] = "Error when creating new donations"
        render 'users/result'
      end
    else
      flash[:alert] = "Error when saving new order"
      render 'users/result'
    end
  end
end
