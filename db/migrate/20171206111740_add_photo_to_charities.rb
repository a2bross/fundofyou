class AddPhotoToCharities < ActiveRecord::Migration[5.1]
  def change
    add_column :charities, :photo, :string
  end
end
