class Goal < ActiveRecord::Base
  belongs_to :user

  def remain_word
  	goal - user.learned_word
  end

  def day_left
  	(deadline.to_date - Date.today).to_f
  end

  def word_average
  	remain_word / day_left
  end
end
