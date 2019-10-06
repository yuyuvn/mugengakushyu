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
  
  def status
    return "In Progress" if DateTime.now.to_date <= deadline.to_date
    return user.results.learned.where("created_at <= ?", deadline.to_date).count >= goal ? "Completed" : "Failed"
  end
end
