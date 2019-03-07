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

Faker::UniqueGenerator.clear

models_array = [User, Tag, Cart, Purchase, SingleCartPic, CatPicTag, CatPicture]

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
	k=0
	unless (k=="success")
		k=0
  	single_cart_pic = FactoryBot.build(:single_cart_pic)
		(single_cart_pic.save ? k="success" : nil )
	end
end

10.times do
	k=0
  unless (k=="success")
		k=0
  	cat_pic_tag = FactoryBot.build(:cat_pic_tag)
		(cat_pic_tag.save ? k="success" : nil )
	end
end

10.times do
  purchase = FactoryBot.create(:purchase)
end

models_array.each do |model|
  puts "#{model.name} : #{model.count} items"
  unless  model.count == 10
    puts "ISSUE of Validation ? the number of generated items differs from the requested one: 10"
	end
  puts
  tp model.last(3)
  puts
end
