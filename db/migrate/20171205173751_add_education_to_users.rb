class AddEducationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :education, :integer
  end
end
