class ChangeReward < ActiveRecord::Migration[5.1]
  def change
    remove_column :rewards, :project_id, :string
    add_reference :rewards, :project, index: true
  end
end
