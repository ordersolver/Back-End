class AddPhotoToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :photo, :text
  end
end
