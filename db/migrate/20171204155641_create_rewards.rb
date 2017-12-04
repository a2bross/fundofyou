class CreateRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards do |t|
      t.string :minimum_donation
      t.text :description
      t.string :delivery_date
      t.string :project_id

      t.timestamps
    end
  end
end
