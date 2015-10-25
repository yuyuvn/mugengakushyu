class Test < ActiveRecord::Base
  belongs_to :word
  has_one :result

  scope :learned, ->{joins(:result).where(results: {correct: true})}
end
