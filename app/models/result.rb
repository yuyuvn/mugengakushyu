class Result < ActiveRecord::Base
  belongs_to :word
  belongs_to :user
  has_one :category, :through => :word
  
  scope :learned, ->{where(correct: true)}
end
