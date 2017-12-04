class AddAmountToSubscription < ActiveRecord::Migration[5.1]
  def change
    add_monetize :subscriptions, :amount, currency: { present: false }
  end
end
