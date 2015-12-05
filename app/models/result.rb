class Result < ActiveRecord::Base
  belongs_to :word
  belongs_to :user
  
  scope :learned, ->{where(results: {correct: true})}
end
