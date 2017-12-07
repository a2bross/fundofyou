class ChangeDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :donations, :status, :integer, :default => 1
  end
end
