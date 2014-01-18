class Boardgame < ActiveRecord::Base
  attr_accessible :title, :description, :rating, :website, :total_rating
  validates :title, :description, :rating, :presence => true
  validates :title, :uniqueness => true

  has_many(:reviews)

  # def average_rating 
  # 	self.total_rating / (self.reviews.all.count)
  # end

  def average_rating
  	total_score = 0.0
  	self.reviews.each do |review|
  		total_score += review.rating
  	end

    total_score/ self.reviews.count
  end


end
