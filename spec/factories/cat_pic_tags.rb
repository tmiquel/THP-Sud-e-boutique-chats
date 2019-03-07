FactoryBot.define do
  factory :cat_pic_tag do
    cat_picture { CatPicture.all.sample }
    tag { Tag.all.sample }
  end
end
