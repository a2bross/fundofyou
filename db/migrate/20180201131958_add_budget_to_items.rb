class AddBudgetToItems < ActiveRecord::Migration[5.1]
  def change
    add_monetize :items, :budget, currency: { present: false }
  end
end
