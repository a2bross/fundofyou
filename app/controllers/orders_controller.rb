class OrdersController < ApplicationController

  def create
    @user = current_user
    @recommendations = Project.recommendation(@user, 3) # for redirection purpose only
    project_ids = [27, 2, nil]
    total_amount = 20
    @project_nb = 2
    @order = Order.new(amount: 20, status: 1)
    # TO DO add condition on number of selected project
    if @order.save
      @donation1 = Donation.new(project: Project.new, user: @user, order: @order, amount: @order.amount.div(@project_nb), status: 1)
      @donation2 = Donation.new(project: Project.new, user: @user, order: @order, amount: @order.amount.div(@project_nb), status: 1)
      if @donation1.save && @donation2.save
        redirect_to new_order_payment_path(@order)
      else
        flash[:alert] = "Error when saving new donations"
        render 'users/result'
      end
    else
      flash[:alert] = "Error when saving new order"
      render 'users/result'
    end
  end
end
