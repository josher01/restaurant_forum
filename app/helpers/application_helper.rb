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

  def avatar_generator(x)
    if x == 0
      image_tag "https://pickaface.net/gallery/avatar/unr_sample_161118_2054_ynlrg.png", class: "responsive-img circle"
    elsif x == 1
      image_tag "https://pickaface.net/gallery/avatar/20160303_155723_4728_Pablo.png", class: "responsive-img circle"
    elsif x == 2
      image_tag "https://pickaface.net/gallery/avatar/20140304_222239_3444_jail.png", class: "responsive-img circle"
    elsif x == 3
      image_tag "https://pickaface.net/gallery/avatar/20130211_084453_4162_Jeff.png", class: "responsive-img circle"
    elsif x == 4
      image_tag "https://pickaface.net/gallery/avatar/20141014_233058_2523_CarsonJr.png", class: "responsive-img circle"
    elsif x == 5
      image_tag "https://pickaface.net/gallery/avatar/unr_elizabeth_170922_0009_zbii0.png", class: "responsive-img circle"
    elsif x == 6
      image_tag "https://pickaface.net/gallery/avatar/unr_susan_171105_1538_gi.png", class: "responsive-img circle"
    else
      image_tag "https://pickaface.net/gallery/avatar/20121023_152128_1823_gasperin.png", class: "responsive-img circle"
    end
  end
end
