class LoadData < ActiveRecord::Migration
  def up
  	down

    base_dir = "app/assets/images/"

  	photo1 = Content.new(:date_time => "2009-08-30 10:44:23",
        :value => "ouster.jpg", :user_id => 1, :content_type => "image")


    f = File.open(base_dir + photo1.value)
    size = ImageSize.new(f.read)

    photo1.width = size.w
    photo1.height = size.h
    #puts "[#{photo1.width}x#{photo1.height}]"

    photo1.save(:validate => false)
    
    photo2 = Content.new(:date_time => "2010-09-13 20:00:00",
        :value => "bieber1.jpg", :user_id => 1, :content_type => "image")

    f = File.open(base_dir + photo2.value)
    size = ImageSize.new(f.read)

    photo2.width = size.w
    photo2.height = size.h

    photo2.save(:validate => false)

    photo3 = Content.new(:date_time => "2010-09-13 20:05:03",
        :value => "bieber2.jpg", :user_id => 1, :content_type => "image")

    f = File.open(base_dir + photo3.value)
    size = ImageSize.new(f.read)

    photo3.width = size.w
    photo3.height = size.h

    photo3.save(:validate => false)

    photo4 = Content.new(:date_time => "2009-11-18 18:02:00",
        :value => "hilton1.jpg", :user_id => 1, :content_type => "image")

    f = File.open(base_dir + photo4.value)
    size = ImageSize.new(f.read)

    photo4.width = size.w
    photo4.height = size.h

    photo4.save(:validate => false)
    photo5 = Content.new(:date_time => "2009-09-20 17:30:00",
        :value => "hilton2.jpg", :user_id => 1, :content_type => "image")

    f = File.open(base_dir + photo5.value)
    size = ImageSize.new(f.read)

    photo5.width = size.w
    photo5.height = size.h

    photo5.save(:validate => false)

    photo6 = Content.new(:date_time => "2009-07-10 16:02:49",
        :value => "obama1.jpg", :user_id => 1, :content_type => "image")

    f = File.open(base_dir + photo6.value)
    size = ImageSize.new(f.read)

    photo6.width = size.w
    photo6.height = size.h

    photo6.save(:validate => false)
    photo7 = Content.new(:date_time => "2010-03-18 23:48:00",
        :value => "obama2.jpg", :user_id => 1, :content_type => "image")

    f = File.open(base_dir + photo7.value)
    size = ImageSize.new(f.read)

    photo7.width = size.w
    photo7.height = size.h

    photo7.save(:validate => false)
    photo8 = Content.new(:date_time => "2010-08-30 14:26:00",
        :value => "obama3.jpg", :user_id => 1, :content_type => "image")
    f = File.open(base_dir + photo8.value)
    size = ImageSize.new(f.read)

    photo8.width = size.w
    photo8.height = size.h

    photo8.save(:validate => false)
    
    photo9 = Content.new(:date_time => "2010-09-04 09:16:32",
        :value => "santa1.jpg", :user_id => 1, :content_type => "image")

    f = File.open(base_dir + photo9.value)
    size = ImageSize.new(f.read)

    photo9.width = size.w
    photo9.height = size.h

    photo9.save(:validate => false)

    first_user = User.new(:first_name => "test", :last_name => "test", :email => "test@test.com", :password => "test")
    first_user.save(:validate => false)
  end

  def down
  	Content.delete_all
    User.delete_all
  end
end
