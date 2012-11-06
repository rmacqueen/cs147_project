class CreateContents < ActiveRecord::Migration
   def up
  	create_table :contents do |t|
  		t.column :user_id,	:integer
  		t.column :date_time,	:date
  		t.column :width,	:integer
  		t.column :height,	:integer
      t.column :content_type, :string
  		t.column :value, :string
  		t.column :other, :string
  	end
  end

  def down
  	drop_table :contents
  end
end
