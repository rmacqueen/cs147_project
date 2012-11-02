class LoadData < ActiveRecord::Migration
  def up
  	down

  	photo1 = Content.new(:date_time => "2009-08-30 10:44:23",
        :value => "ouster.jpg", :user_id => 1)

    photo1.save(:validate => false)
    
    photo2 = Content.new(:date_time => "2010-09-13 20:00:00",
        :value => "bieber1.jpg", :user_id => 1)

    photo2.save(:validate => false)
    photo3 = Content.new(:date_time => "2010-09-13 20:05:03",
        :value => "bieber2.jpg", :user_id => 1)

    photo3.save(:validate => false)

    photo4 = Content.new(:date_time => "2009-11-18 18:02:00",
        :value => "hilton1.jpg", :user_id => 1)

    photo4.save(:validate => false)
    photo5 = Content.new(:date_time => "2009-09-20 17:30:00",
        :value => "hilton2.jpg", :user_id => 1)

    photo5.save(:validate => false)

    photo6 = Content.new(:date_time => "2009-07-10 16:02:49",
        :value => "obama1.jpg", :user_id => 1)

    photo6.save(:validate => false)
    photo7 = Content.new(:date_time => "2010-03-18 23:48:00",
        :value => "obama2.jpg", :user_id => 1)

    photo7.save(:validate => false)
    photo8 = Content.new(:date_time => "2010-08-30 14:26:00",
        :value => "obama3.jpg", :user_id => 1)

    photo8.save(:validate => false)
    
    photo9 = Content.new(:date_time => "2010-09-04 09:16:32",
        :value => "santa1.jpg", :user_id => 1)

    photo9.save(:validate => false)
  end

  def down
  	Content.delete_all
    User.delete_all
  end
end
