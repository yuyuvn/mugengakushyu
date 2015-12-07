class StaticPagesController < ApplicationController
  def home
    @categories = Category.all if user_signed_in?
  end
  
  def statistics
    @learned_data = []
    Category.all.each {|cat|
      count = 0
      current = current_user.results.learned.joins(:word).where("words.category_id" => cat.id).group_by_day("results.created_at")
        .count.each_with_object({}){|(k,v),o| o[k.to_date]= count += v}
      @learned_data << {name: cat.name, data: current} if count > 0
    }
    
    @learned_words = current_user.results.learned.joins(:category).group("categories.name").count
    @learned_kanji = current_user.results.learned.distinct.joins(:category).group("categories.name").count(:word_id)
    
    data = current_user.results.learned.where("created_at >= ?", 1.month.ago).group_by_day("created_at")
      .count.each_with_object({}){|(k,v),o| o[k.to_date]=v}
    (1.month.ago.to_date..DateTime.now.to_date).each {|day|
      data[day] = 0 if data[day].nil?
    }
    
    @learned_monthly_data = [{name: "Learned", data: data}]
    
    @wrong_words = Word.joins(:results).select("COUNT(results.word_id) AS times, words.text").where("results.correct" => false)
      .where("results.user_id" => current_user.id).group("results.word_id")
      .order("times desc").limit(30)
      
    @wrong_kanjis = WrongKanji.where(user: current_user).order("times desc").limit(30)
  end
end
