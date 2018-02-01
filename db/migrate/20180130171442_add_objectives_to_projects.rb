class AddObjectivesToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :objectives, :string
  end
end
