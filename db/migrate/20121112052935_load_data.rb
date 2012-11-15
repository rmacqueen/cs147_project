class LoadData < ActiveRecord::Migration
  def up
  	down

    base_dir = "app/assets/images/"
    
	##Day 1: Coachella##
    day1 = Content.new(:date_time => "2011-04-17 10:44:23", 
                       :value => "Day 1: Coachella", :trip_id => 1, :content_type => "milestone", :milestone_index => 0)
    day1.save()
    
    #Poster#
    poster = Content.new(:date_time => "2011-04-17 10:44:23",
        :value => "res_stocktrip/poster.jpeg", :trip_id => 1, :content_type => "image", :milestone_index => 0)
    f = File.open(base_dir + poster.value)
    size = ImageSize.new(f.read)
	poster.width = size.w
    poster.height = size.h
    poster.save(:validate => false)
	
	#Photo 1#
  	photo1_1 = Content.new(:date_time => "2011-04-17 10:44:23",
        :value => "res_stocktrip/1_day1.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 0)
    f = File.open(base_dir + photo1_1.value)
    size = ImageSize.new(f.read)
    photo1_1.width = size.w
    photo1_1.height = size.h
    photo1_1.save(:validate => false)
    
    #Text 1#
    text1_1 = Content.new(:date_time => "2011-04-17 10:44:23",
        :value => "We left for Coachella, the 8 hour road trip from Stanford to Indio, Ca, at 10:00pm. We drove through the night to get to Coachella Friday morning before the show started! We got there just in time for Skrillex which was sooo sick. We were already wasted since we had been drinking all the way up through the night (bad idea for trying to last a whole day at Coachella haha). We saw some other sweet bands like The Morning Benders, Tame Impala, Ozomatli, Cut Copy, Crystal Castles, Interpol, and the Black Keys. Brandon Flowers was awesome because he's the lead singer of the Killers and in one of the songs he played, he brought out the entire band to play with him! It was like seeing last year's headlining band all over again but with better spots. Kings of Leon crushed it at the end, but the Chemical Brothers had one of the most amazing light shows I'd ever seen! Looking forward to tomorrow's lineup.", :trip_id => 1, :content_type => "text", :milestone_index => 0, :other => "Kings of Leon and Afrojack!")
    text1_1.save(:validate => false)
    
    #Photo 2#
    photo2_1 = Content.new(:date_time => "2011-04-17 10:44:23",
        :value => "res_stocktrip/2_day1.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 0)
    f = File.open(base_dir + photo2_1.value)
    size = ImageSize.new(f.read)
    photo2_1.width = size.w
    photo2_1.height = size.h
    photo2_1.save(:validate => false)

	#Photo 3#
    photo3_1 = Content.new(:date_time => "2011-04-17 10:44:23",
        :value => "res_stocktrip/3_day1.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 0)
    f = File.open(base_dir + photo3_1.value)
    size = ImageSize.new(f.read)
    photo3_1.width = size.w
    photo3_1.height = size.h
    photo3_1.save(:validate => false)
    
    #Photo 4#
    photo4_1 = Content.new(:date_time => "2011-04-17 10:44:23",
        :value => "res_stocktrip/4_day1.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 0)
    f = File.open(base_dir + photo4_1.value)
    size = ImageSize.new(f.read)
    photo4_1.width = size.w
    photo4_1.height = size.h
    photo4_1.save(:validate => false)
    
    #Photo 5#
    photo5_1 = Content.new(:date_time => "2011-04-17 10:44:23",
        :value => "res_stocktrip/5_day1.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 0)
    f = File.open(base_dir + photo5_1.value)
    size = ImageSize.new(f.read)
    photo5_1.width = size.w
    photo5_1.height = size.h
    photo5_1.save(:validate => false)
    
    #Photo 6#
    photo6_1 = Content.new(:date_time => "2011-04-17 10:44:23",
        :value => "res_stocktrip/6_day1.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 0)
    f = File.open(base_dir + photo6_1.value)
    size = ImageSize.new(f.read)
    photo6_1.width = size.w
    photo6_1.height = size.h
    photo6_1.save(:validate => false)
    
    #Photo 7#
    photo7_1 = Content.new(:date_time => "2011-04-17 10:44:23",
        :value => "res_stocktrip/7_day1.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 0)
    f = File.open(base_dir + photo7_1.value)
    size = ImageSize.new(f.read)
    photo7_1.width = size.w
    photo7_1.height = size.h
    photo7_1.save(:validate => false)
    
    #Video 1#
    #video1_1 = Content.new(:date_time => "2011-04-17 10:44:23",
    #   :value => "10fc16b2fe071c317c16643173369734", :trip_id => 1, :content_type => "video", :milestone_index => 0)
    #video1_1.save(:validate => false)
    
    #Photo 8#
    photo8_1 = Content.new(:date_time => "2011-04-17 10:44:23",
        :value => "res_stocktrip/8_day1.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 0)
    f = File.open(base_dir + photo8_1.value)
    size = ImageSize.new(f.read)
    photo8_1.width = size.w
    photo8_1.height = size.h
    photo8_1.save(:validate => false)
    
    #Photo 9#
    photo9_1 = Content.new(:date_time => "2011-04-17 10:44:23",
        :value => "res_stocktrip/9_day1.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 0)
    f = File.open(base_dir + photo9_1.value)
    size = ImageSize.new(f.read)
    photo9_1.width = size.w
    photo9_1.height = size.h
    photo9_1.save(:validate => false)
    
    #Photo 10#
    photo10_1 = Content.new(:date_time => "2011-04-17 10:44:23",
        :value => "res_stocktrip/10_day1.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 0)
    f = File.open(base_dir + photo10_1.value)
    size = ImageSize.new(f.read)
    photo10_1.width = size.w
    photo10_1.height = size.h
    photo10_1.save(:validate => false)
    
    #Photo 11#
	photo11_1 = Content.new(:date_time => "2011-04-17 10:44:23",
        :value => "res_stocktrip/11_day1.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 0)
    f = File.open(base_dir + photo11_1.value)
    size = ImageSize.new(f.read)
    photo11_1.width = size.w
    photo11_1.height = size.h
    photo11_1.save(:validate => false)
	
	
	
	##Day 2: Coachella##
    day2 = Content.new(:date_time => "2011-04-18 10:44:23", 
        :value => "Day 2: Coachella", :trip_id => 1, :content_type => "milestone", :milestone_index => 1)
    day2.save()

	#Photo 1#
	photo1_2 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/1_day2.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 1)
    f = File.open(base_dir + photo1_2.value)
    size = ImageSize.new(f.read)
    photo1_2.width = size.w
    photo1_2.height = size.h
    photo1_2.save(:validate => false)
    
    #Video 1#
    #video1_2 = Content.new(:date_time => "2011-04-18 10:44:23",
    #    :value => "e7face4eec99c7b53c77506647840897", :trip_id => 1, :content_type => "video", :milestone_index => 0)
    #video1_2.save(:validate => false)
    
     #Text 1#
    text1_2 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "The second day of Coachella was yet another day of complete insanity with bands and all. We started off with the Twelves, saw Chuckie which I had never heard of (who is an up and coming EDM DJ), Two Door Cinema Club, Foals (best live performance of the weekend in my opinion), and Broken Social Scene. Nelson and I went to the dead front of the crowd for Empire of the Sun later in the day because we had been waiting to see them for about two years. They had some incredible outfits and dancers, and the music was so much better live. Mumford and Sons played a great show, but Arcade Fire put the night over the top after they played most of their new CD. Overall, a great second night of the trip", :trip_id => 1, :content_type => "text", :milestone_index => 1, :other => "Foals and Empire of the Sun, incredible")
    text1_2.save(:validate => false)
    
    #Photo 2#
    photo2_2 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/2_day2.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 1)
    f = File.open(base_dir + photo2_2.value)
    size = ImageSize.new(f.read)
    photo2_2.width = size.w
    photo2_2.height = size.h
    photo2_2.save(:validate => false)
    
    #Photo 3#
    photo3_2 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/3_day2.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 1)
    f = File.open(base_dir + photo3_2.value)
    size = ImageSize.new(f.read)
    photo3_2.width = size.w
    photo3_2.height = size.h
    photo3_2.save(:validate => false)
    
    #Photo 4#
    photo4_2 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/4_day2.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 1)
    f = File.open(base_dir + photo4_2.value)
    size = ImageSize.new(f.read)
    photo4_2.width = size.w
    photo4_2.height = size.h
    photo4_2.save(:validate => false)
    
    #Photo 5#
    photo5_2 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/5_day2.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 1)
    f = File.open(base_dir + photo5_2.value)
    size = ImageSize.new(f.read)
    photo5_2.width = size.w
    photo5_2.height = size.h
    photo5_2.save(:validate => false)
    
    #Photo 6#
    photo6_2 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/6_day2.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 1)
    f = File.open(base_dir + photo6_2.value)
    size = ImageSize.new(f.read)
    photo6_2.width = size.w
    photo6_2.height = size.h
    photo6_2.save(:validate => false)
    
    #Photo 7#
    photo7_2 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/7_day2.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 1)
    f = File.open(base_dir + photo7_2.value)
    size = ImageSize.new(f.read)
    photo7_2.width = size.w
    photo7_2.height = size.h
    photo7_2.save(:validate => false)
    
    #Photo 8#
    photo8_2 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/8_day2.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 1)
    f = File.open(base_dir + photo8_2.value)
    size = ImageSize.new(f.read)
    photo8_2.width = size.w
    photo8_2.height = size.h
    photo8_2.save(:validate => false)
    
    #Video 2#
    #video2_2 = Content.new(:date_time => "2011-04-17 10:44:23",
    #   :value => "82dfe49441eaa38336c44428ae366036", :trip_id => 1, :content_type => "video", :milestone_index => 0)
    #video2_2.save(:validate => false)
    
    #Photo 9#
    photo9_2 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/9_day2.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 1)
    f = File.open(base_dir + photo9_2.value)
    size = ImageSize.new(f.read)
    photo9_2.width = size.w
    photo9_2.height = size.h
    photo9_2.save(:validate => false)
    
    

	##Day 3: Coachella!##
    day3 = Content.new(:date_time => "2011-04-19 10:44:23", 
        :value => "Day 3: Coachella", :trip_id => 1, :content_type => "milestone", :milestone_index => 2)
    day3.save()
    
    #Text 1#
    text1_3 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "Third day of Coachella. I wish it never had to end. I loved watching Chromeo, Ratatat and Wiz Khalifa. The National played an amazing show as well, and Foster the People killed it too. But I have never seen such a performance like Kanye West's...holy shit. He had it all: fireworks, on-stage dancers, and different set designs. He was so sick to watch, so unforgettable. Honestly, Coachella weekend trip = one of the best trips of my life. Can't wait for next year!", :trip_id => 1, :content_type => "text", :milestone_index => 2, :other => "Last day! Nooo")
    text1_3.save(:validate => false)

	#Photo 1#
	photo1_3 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/1_day3.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 2)
    f = File.open(base_dir + photo1_3.value)
    size = ImageSize.new(f.read)
    photo1_3.width = size.w
    photo1_3.height = size.h
    photo1_3.save(:validate => false)
	
	#Photo 2#
	photo2_3 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/2_day3.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 2)
    f = File.open(base_dir + photo2_3.value)
    size = ImageSize.new(f.read)
    photo2_3.width = size.w
    photo2_3.height = size.h
    photo2_3.save(:validate => false)
	
	#Photo 3#
	photo3_3 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/3_day3.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 2)
    f = File.open(base_dir + photo3_3.value)
    size = ImageSize.new(f.read)
    photo3_3.width = size.w
    photo3_3.height = size.h
    photo3_3.save(:validate => false)
	
	#Photo 4#
	photo4_3 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/4_day3.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 2)
    f = File.open(base_dir + photo4_3.value)
    size = ImageSize.new(f.read)
    photo4_3.width = size.w
    photo4_3.height = size.h
    photo4_3.save(:validate => false)
	
	#Photo 5#
	photo5_3 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/5_day3.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 2)
    f = File.open(base_dir + photo5_3.value)
    size = ImageSize.new(f.read)
    photo5_3.width = size.w
    photo5_3.height = size.h
    photo5_3.save(:validate => false)
	
	#Photo 6#
	photo6_3 = Content.new(:date_time => "2011-04-18 10:44:23",
        :value => "res_stocktrip/6_day3.JPG", :trip_id => 1, :content_type => "image", :milestone_index => 2)
    f = File.open(base_dir + photo6_3.value)
    size = ImageSize.new(f.read)
    photo6_3.width = size.w
    photo6_3.height = size.h
    photo6_3.save(:validate => false)
	
    

    first_user = User.new(:first_name => "test", :last_name => "test", :email => "test@test.com", :password => "test")
    first_user.save(:validate => false)

    trip1 = Trip.new(:name => "Coachella 2011", :user_id => 1, :cover_photo => "slide_1.jpg")
    trip1.save()
 
    trip2 = Trip.new(:name => "Eurotrip", :user_id => 1, :cover_photo => "slide_3.jpg")
    trip2.save()

    trip3 = Trip.new(:name => "Cruise to Mexico", :user_id => 1, :cover_photo => "slide_2.jpg")
    trip3.save()
  end

  def down
  	Content.delete_all
    User.delete_all
  end
end
