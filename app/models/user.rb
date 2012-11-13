class User < ActiveRecord::Base
  has_many :trips
  # attr_accessible :title, :body
  attr_accessible :first_name, :last_name, :email, :password

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :password, :presence => true
  validates_uniqueness_of :email


  def password_valid?(candidate)
		#test = Digest::SHA1.hexdigest(candidate + self.salt.to_s)
		return (candidate == self.password)
	end

	
end
