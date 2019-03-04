User.destroy_all
CatPicture.destroy_all
Tag.destroy_all
Cart.destroy_all
SingleCartPic.destroy_all
CatPicTag.destroy_all
Purchase.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

10.times do
	user = FactoryBot.create(:user)
end

10.times do
	tag = FactoryBot.create(:tag)
end

10.times do
	cat_picture = FactoryBot.create(:cat_picture)
end

10.times do
  cart = FactoryBot.create(:cart)
end

10.times do
  single_cart_pic = FactoryBot.create(:single_cart_pic)
end

10.times do
  cat_pic_tag = FactoryBot.create(:cat_pic_tag)
end

10.times do
  purchase = FactoryBot.create(:purchase)
end
