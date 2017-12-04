class CreateUserCriteria < ActiveRecord::Migration[5.1]
  def change
    create_table :user_criteria do |t|
      t.integer :value, default: 0
      t.references :criteria, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
