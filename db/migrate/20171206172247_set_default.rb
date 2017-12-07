class SetDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :projects, :completion_rate, :integer, :default => 0
  end
end
