# frozen_string_literal: true

class AddSlugToCatPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :cat_pictures, :slug, :string
    add_index :cat_pictures, :slug, unique: true
  end
end
