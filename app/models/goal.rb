class Goal < ActiveRecord::Base
  belongs_to :user

  def remain_word
  	[goal - user.learned_word,0].max
  end

  def day_left
  	[(deadline.to_date - Date.today).to_f,0].max
  end

  def word_average
  	day_left > 0 ? remain_word / day_left : 0
  end
end
