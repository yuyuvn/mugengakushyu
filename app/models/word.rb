class Word < ActiveRecord::Base
  belongs_to :category
  
  def self.get_word_by_category category_id
     Word.find(1+Random.rand(Word.count)) 
  end
end
