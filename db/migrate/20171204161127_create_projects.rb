class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :contact_name
      t.string :address
      t.date :start_date
      t.date :end_date
      t.references :charity, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
