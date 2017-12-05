class AddEducationToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :education, :integer
  end
end
