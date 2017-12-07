class AddPaymentToDonation < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :payment, :jsonb
  end
end
