class CreateCharities < ActiveRecord::Migration[5.1]
  def change
    create_table :charities do |t|
      t.string :name
      t.string :immatriculation
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :contact_name
      t.text :description

      t.timestamps
    end
  end
end
