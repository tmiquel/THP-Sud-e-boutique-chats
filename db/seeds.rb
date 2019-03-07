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

if Rails.env.production?
  Dir.glob(Rails.root.join("public", "assets", "cats", "*.jpg")) do |pic_path|

  	cat_picture = CatPicture.new(title: Faker::Creature::Cat.breed,
  		price: rand(2..27))
  	cat_picture.picture_file.attach(io: File.open(pic_path), filename: ('img.jpeg'))
  	cat_picture.save
  end
else
  Dir.glob(Rails.root.join("app", "assets", "images", "cats", "*.jpeg")) do |pic_path|
    puts "pic_path"
    puts pic_path
    puts

  	cat_picture = CatPicture.new(title: Faker::Creature::Cat.breed,
  		price: rand(2..27))
  	cat_picture.picture_file.attach(io: File.open(pic_path), filename: ('img.jpeg'))
  	cat_picture.save
  end
end

10.times do
  cart = FactoryBot.create(:cart)
end

10.times do
	while true
  	single_cart_pic = FactoryBot.build(:single_cart_pic)
		break if single_cart_pic.save 
	end
end

10.times do
  while true
  	cat_pic_tag = FactoryBot.build(:cat_pic_tag)
		break if cat_pic_tag.save
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

