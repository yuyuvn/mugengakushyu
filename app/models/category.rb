class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  has_many :kanjis, dependent: :destroy

  def percent user
    words_count = words.count
    return 0 if words_count == 0
    ((user.results.joins(:word).where({ "words.category_id" => id, correct: true })
        .distinct.count(:word_id).to_f/words_count)*100).to_i
  end
end
