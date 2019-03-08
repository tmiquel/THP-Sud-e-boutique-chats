# frozen_string_literal: true

class Tag < ApplicationRecord
  validates :tag_name, presence: true, uniqueness: true
  has_many :cat_pic_tags
end
