class OrdersController < ApplicationController

  def create
    @user = current_user
    @order = Order.new(amount: params[:amount])
    authorize @order
    if @order.save
      redirect_to order_result_path(@order)
    else
      flash[:alert] = "Error when saving new order"
      render 'users/chose_donation'
    end
  end

  def update
    @order = Order.find(params[:id])
    @user = current_user
    authorize @order
    # for redirection purpose only
    @recommendations = Project.recommendation(@user, 3)
    @projects = []
    @recommendations.each do |reco|
      @projects << Project.find(reco[:project_id])
    end
    # selected projects from params
    selected_projects = []
    selected_projects << Project.find(params[:project_1]) unless params[:project_1].nil?
    selected_projects << Project.find(params[:project_2]) unless params[:project_2].nil?
    selected_projects << Project.find(params[:project_3]) unless params[:project_3].nil?
    project_nb = selected_projects.size
    selected_projects.each do |project|
      Donation.create!(project: project, user: @user, order: @order, amount: @order.amount.div(project_nb), status: 1)
    end
    if @order.update(project_nb: project_nb)
      redirect_to new_order_payment_path(@order)
    else
      flash[:alert] = "Error when creating new donations"
      render 'users/result'
    end
  end

  private

  def order_params
    params.require(:order).permit(:amount, :payment)
  end
end
