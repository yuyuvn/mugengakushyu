class LearnsController < ApplicationController
  before_action :logined
  
  def word
    @category =Category.find_by(name: params['category'])
    @word = @category.words.order("RAND()").limit(1).first
    #@kanjis = Kanji.get_kanjis_by_category(@category.id)
    #@percent = self.percent(@category.id)
    @percent = 0
    tmp_word = @word.text.gsub(/[\p{Han}]/, '*')
    kanji_characters = @word.text.scan(/[\p{Han}]/)
    @kanjis = @category.kanjis.where.not(text: kanji_characters).order("RAND()").limit(8-kanji_characters.count).pluck(:text)+kanji_characters
    
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
      unless is_matched
        wkanji = WrongKanji.find_or_create_by({user: current_user, kanji: character})
        wkanji.update_attributes(times: wkanji.times + 1)
      end
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
    @word = @category.words.order("RAND()").limit(1).first
    #@percent = self.percent(params['category_id'])
    @percent = 0
    tmp_word = @word.text.gsub(/[\p{Han}]/, '*')
    kanji_characters = @word.text.scan(/[\p{Han}]/)
    @kanjis = @category.kanjis.where.not(text: kanji_characters).order("RAND()").limit(8-kanji_characters.count).pluck(:text)+kanji_characters
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
