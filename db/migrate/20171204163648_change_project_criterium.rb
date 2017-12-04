class ChangeProjectCriterium < ActiveRecord::Migration[5.1]
  def change
    remove_reference :project_criteria, :user, index: true, foreign_key: true
    add_reference :project_criteria, :project, index: true, foreign_key: true
  end
end
