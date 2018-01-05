module ApplicationHelper
  def photo_generator(x)
    if x == 0
      image_tag "https://images.unsplash.com/photo-1494346480775-936a9f0d0877?auto=format&fit=crop&w=1003&q=80", class: "responsive-img"
    elsif x == 1
      image_tag "https://images.unsplash.com/photo-1505826759037-406b40feb4cd?auto=format&fit=crop&w=1052&q=80", class: "responsive-img"
    elsif x == 2
      image_tag "https://images.unsplash.com/photo-1505275350441-83dcda8eeef5?auto=format&fit=crop&w=967&q=80", class: "responsive-img"
    elsif x == 3
      image_tag "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?auto=format&fit=crop&w=944&q=80", class: "responsive-img"
    else
      image_tag "https://images.unsplash.com/photo-1498654896293-37aacf113fd9?auto=format&fit=crop&w=1050&q=80", class: "responsive-img"
    end
  end
end
