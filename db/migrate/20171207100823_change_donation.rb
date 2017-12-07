class ChangeDonation < ActiveRecord::Migration[5.1]
  def change
    remove_column :donations, :payment, :jsonb
  end
end
