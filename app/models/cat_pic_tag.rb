# frozen_string_literal: true

class CatPicTag < ApplicationRecord
  belongs_to :cat_picture
  belongs_to :tag
  validate :no_tags_duplicata

  private

  def no_tags_duplicata
    CatPicTag.all.each do |cat_pic_tag|
      errors.add(:cat_picture, "The same tag can't be applied twice to the same pic") if (cat_pic_tag.cat_picture == cat_picture) && (cat_pic_tag.tag == tag)
    end
  end
end
