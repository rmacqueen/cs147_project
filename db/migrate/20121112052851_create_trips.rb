class CreateTrips < ActiveRecord::Migration
   def up
  	create_table :trips do |t|
  		t.column :user_id,	:integer
      t.column :name, :string
  		t.column :cover_photo, :string
  	end
  end

  def down
  	drop_table :trips
  end
end
