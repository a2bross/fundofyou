class OrdersController < ApplicationController

  def create
    @user = current_user
    @recommendations = Project.recommendation(@user, 3) # for redirection purpose only
    @selected_projects = []
    @selected_projects << Project.find(params[:project_1]) unless params[:project_1].nil?
    @selected_projects << Project.find(params[:project_2]) unless params[:project_2].nil?
    @selected_projects << Project.find(params[:project_3]) unless params[:project_3].nil?
    project_nb = @selected_projects.size
    @order = Order.new(amount: params[:amount])
    authorize @order
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

  def update
    @order = Order.find(params[:id])
    authorize @order
    if @order.update(amount: params[:order][:amount])
      respond_to do |format|
        format.html { redirect_to new_order_payment_path(@order) }
        format.js
      end
    else
      flash[:alert] = "Error when updating the contribution"
      format.html { redirect_to new_order_payment_path(@order) }
      format.js
    end
  end

  private

  def order_params
    params.require(:order).permit(:amount, :payment)
  end
end
