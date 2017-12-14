class PaymentsController < ApplicationController
  before_action :set_order, :set_user
  skip_after_action :verify_authorized

  def new
    @donations = @order.donations
  end

  def create
    @user.update(first_name: params[:first_name], last_name: params[:last_name], address: params[:address])
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.amount_cents,
      description:  "Payment for #{@order.donations.size} donations for order #{@order.id}",
      currency:     @order.amount.currency
    )

    @order.update(payment: charge.to_json, status: 20)
    @order.donations.last(@order.project_nb).each do |donation|
      donation.update(status: 20, execution_date: Date.today)
      donation.project.update_completion_rate
    end
    redirect_to user_path(@user)

  rescue StandardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

  private

  def set_user
    @user = current_user
  end

  def set_order
    @order = Order.where(status: 1).find(params[:order_id])
  end
end
