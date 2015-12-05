class LearnsController < ApplicationController
  before_action :logined
  
  def word
    @category =Category.find_by(name: params['category'])
    if @category.nil? 
      raise ActionController::RoutingError.new('Not Found')
    end
    @word = Word.get_word_by_category(@category.id)
    if @word.nil? 
      raise ActionController::RoutingError.new('Chưa có dữ liệu')
    end
    @kanjis = Kanji.get_kanjis_by_category(@category.id)
    @percent = self.percent(@category.id)
    all_kanjis = Kanji.where(category_id: @category.id).pluck(:text)
    tmp_word = @word.text.gsub(/[\p{Han}]/, '*')
    kanji_characters = @word.text.scan(/[\p{Han}]/)
    @kanjis = all_kanjis.shuffle[0..(9-kanji_characters.length)]+kanji_characters
    @kanjis.uniq!
    @kanjis.shuffle!
    @characters = tmp_word.split(//)
    
    render :layout => 'learn'
  end
  
  def check
    word = Word.select(:id,:text,:mean,:pronounce).find_by(id:params['word_id'],category_id: params['category_id'])
    result = {'word'=>word}
    kanji_characters = word.text.scan(/[\p{Han}]/)
    answer_kanji_characters = params['answer'].scan(/[\p{Han}*]/)
    matchs =Array.new
    kanji_characters.each_with_index do |character, index|
      is_matched = (character.eql? answer_kanji_characters[index]) || ("*".eql? answer_kanji_characters[index])
      matchs.push({'is_matched' => is_matched,
                    'correct' => Kanji.select(:text,:mean).find_by(text: character),
                    'not_correct' => is_matched ? "" : Kanji.select(:text,:mean).find_by(text: answer_kanji_characters[index])
                  })
    end
    result['matchs'] = matchs
    Result.create(:word_id => word.id,:user_id => current_user.id,:correct => (word.text.eql? params['answer']) )
    result['status'] = 200
    render :json => result
  end
  
  def kanji
    render :json => {'status'=>200,'info'=>Kanji.find_by(text: params['kanji'],category_id: params['category_id'])}
  end 
  def questtion
    @category =Category.find(params['category_id'])
    @word = Word.get_word_by_category(params['category_id'])
    @percent = self.percent(params['category_id'])
    @kanjis = Kanji.get_kanjis_by_category(params['category_id'])
    all_kanjis = Kanji.where(category_id: params['category_id']).pluck(:text)
    tmp_word = @word.text.gsub(/[\p{Han}]/, '*')
    kanji_characters = @word.text.scan(/[\p{Han}]/)
    @kanjis = all_kanjis.shuffle[0..(9-kanji_characters.length)]+kanji_characters
    @kanjis.uniq!
    @kanjis.shuffle!
    @characters = tmp_word.split(//)
    render :json => {'status'=>200,'html'=>render_to_string(:action => "word", :layout => false)}
  end 
  
  def percent category_id
      (Result.joins(:word).where({ "words.category_id" => category_id,'results.correct' => true }).distinct.count(:word_id).to_f/Word.where({ category_id: category_id }).count()).round(2)*100
  end
  
  private
    def logined
        if !user_signed_in?
           redirect_to "/users/sign_in"
        end
    end
end
