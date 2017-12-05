class AddCriteriaToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :environment, :integer
    add_column :projects, :humanitarian, :integer
    add_column :projects, :social, :integer
    add_column :projects, :preservation, :integer
    add_column :projects, :research, :integer
    add_column :projects, :local, :integer
    add_column :projects, :abroad, :integer
    add_column :projects, :urgency, :integer
  end
end
