class CreateSingleCartPics < ActiveRecord::Migration[5.2]
  def change
    create_table :single_cart_pics do |t|
			t.belongs_to :cart, :cat_picture, index: true
      t.integer :quantities
      t.datetime :purchase_date

      t.timestamps
    end
  end
end
