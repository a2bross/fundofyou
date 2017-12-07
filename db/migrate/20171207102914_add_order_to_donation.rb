class AddOrderToDonation < ActiveRecord::Migration[5.1]
  def change
    add_reference :donations, :order, foreign_key: true
  end
end
