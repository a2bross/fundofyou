class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :contact_name
      t.string :address
      t.string :start_date
      t.string :end_date
      t.string :association_id
      t.string :status_string

      t.timestamps
    end
  end
end
