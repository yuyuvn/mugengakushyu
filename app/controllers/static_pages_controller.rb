class StaticPagesController < ApplicationController
  def home
    categories = Category.all
    @categories = Array.new
    categories.each_with_index do |category, index|
      category.percent = self.percent(category.id).nan? ? 0 : self.percent(category.id)
      @categories.push(category)
    end
  end
  def percent category_id
      (Result.joins(:word).where({ "words.category_id" => category_id,'results.correct' => true }).count(:word_id).to_f/Word.where({ category_id: category_id }).count()).round(2)*100
  end
end
