namespace :dev do
  task fake_restaurant: :environment do   
    Restaurant.destroy_all
    100.times do |i|
      Restaurant.create!(res_name: FFaker::Name.first_name,
        res_opening_hours: FFaker::Time.datetime,
        res_tel: FFaker::PhoneNumber.short_phone_number,
        res_address: FFaker::Address.street_address,
        res_description: FFaker::Lorem.paragraph,
        category: Category.all.sample
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end
  
  task fake_user: :environment do
    20.times do |i|
      user_name = FFaker::Name.unique.first_name
      User.create!(name: user_name, email: "#{user_name}@example.com",
        password: "123456"
      )
    end
    puts "have created fake users"
    puts "now you have #{User.count} users data"
  end
  
  task fake_comment: :environment do
    Comment.destroy_all
    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
    end
    puts "have created fake users"
    puts "now you have #{Comment.count} comments data"
  end

   #fake favorite
  task fake_favorite: :environment do
    Favorite.destroy_all
    puts "creating fake favorites..." 
    User.all.each do |u|
     20.times do
       u.favorites.create!(
        restaurant: Restaurant.all.sample,
       )      
     end     
    end
    puts "now you have fake #{Favorite.count} favorited restaurants"
  end 



end