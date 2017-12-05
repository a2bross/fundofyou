class AddCriteriaToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :environment, :integer
    add_column :users, :humanitarian, :integer
    add_column :users, :social, :integer
    add_column :users, :preservation, :integer
    add_column :users, :research, :integer
    add_column :users, :local, :integer
    add_column :users, :abroad, :integer
  end
end
