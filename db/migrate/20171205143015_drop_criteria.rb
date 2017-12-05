class DropCriteria < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_criteria
    drop_table :project_criteria
    drop_table :criteria
  end
end
