class AddCompletionRateToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :completion_rate, :integer
  end
end
