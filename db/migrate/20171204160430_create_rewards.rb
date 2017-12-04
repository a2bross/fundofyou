class CreateRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards do |t|
      t.integer :minimum_donation
      t.text :description
      t.date :delivery_date
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
