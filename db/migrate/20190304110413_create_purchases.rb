class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
			t.belongs_to :single_cart_pic, index: true
      t.integer :quantities
      t.datetime :purchase_date
			t.string :stripe_customer_id

      t.timestamps
    end
  end
end
