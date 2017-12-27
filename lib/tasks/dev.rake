namespace :dev do
  task fake_restaurant: :environment do
    

    Restaurant.where("photo = ?", nil).each do |restaurant|
      photo_list = [
      {photo: "https://images.unsplash.com/photo-1494346480775-936a9f0d0877?auto=format&fit=crop&w=1003&q=80"},
      {photo: "https://images.unsplash.com/photo-1505826759037-406b40feb4cd?auto=format&fit=crop&w=1052&q=80"},
      {photo: "https://images.unsplash.com/photo-1505275350441-83dcda8eeef5?auto=format&fit=crop&w=967&q=80"},
      {photo: "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?auto=format&fit=crop&w=944&q=80"},
      {photo: "https://images.unsplash.com/photo-1498654896293-37aacf113fd9?auto=format&fit=crop&w=1050&q=80"}
    ]
      restaurant.update!(
       remote_photo_url: photo_list[:photo].all.sample
      )
    end
    puts "have created fake restaurants"

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

end