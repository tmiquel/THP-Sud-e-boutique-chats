# frozen_string_literal: true

class CreateSingleCartPics < ActiveRecord::Migration[5.2]
  def change
    create_table :single_cart_pics do |t|
      t.belongs_to :cart, :cat_picture, index: true
      t.integer :amount

      t.timestamps
    end
  end
end
