class AddProjectNbToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :project_nb, :integer
  end
end
