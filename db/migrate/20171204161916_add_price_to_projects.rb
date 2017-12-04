class AddPriceToProjects < ActiveRecord::Migration[5.1]
  def change
    add_monetize :projects, :budget, currency: { present: false }
  end
end
