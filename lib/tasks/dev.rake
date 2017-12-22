namespace :dev do
  task fake: :environment do
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

  task fake: :environment do
    User.destroy_all

    20.times do |i|
      User.create!(email: FFaker::Internet.email,
        password: FFaker::Internet.password,
        
      )
    end
    puts "have created fake users"
    puts "now you have #{User.count} restaurants data"
  end
end