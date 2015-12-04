class Word < ActiveRecord::Base
  belongs_to :category
  
  def self.get_word_by_category category_id
     Word.find_by(id: 1+Random.rand(Word.count),category_id: category_id) 
  end
end
