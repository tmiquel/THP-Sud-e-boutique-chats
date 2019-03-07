class CreateCatPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_pictures do |t|
      t.string :title
      t.float :price

      t.timestamps
    end
  end
end
