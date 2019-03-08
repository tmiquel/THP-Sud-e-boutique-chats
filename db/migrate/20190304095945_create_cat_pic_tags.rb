# frozen_string_literal: true

class CreateCatPicTags < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_pic_tags do |t|
      t.belongs_to :cat_picture, :tag, index: true

      t.timestamps
    end
  end
end
