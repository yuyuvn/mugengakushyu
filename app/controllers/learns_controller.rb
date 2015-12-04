class LearnsController < ApplicationController
  before_action :logined
  
  def word
    @word = Word.get_word_by_category(1)
    @kanjis = Kanji.get_kanjis_by_category(1)
    @percent = self.percent(1)
    all_kanjis = Kanji.where(category_id: 1).pluck(:text)
    tmp_word = @word.text.gsub(/[\p{Han}]/, '*')
    kanji_characters = @word.text.scan(/[\p{Han}]/)
    @kanjis = all_kanjis.shuffle[0..(9-kanji_characters.length)]+kanji_characters
    @kanjis.uniq!
    @kanjis.shuffle!
    @characters = tmp_word.split(//)
  end
  
  def check
    word = Word.select(:id,:text,:mean,:pronounce).find(params['word_id'])
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
    render :json => {'status'=>200,'info'=>Kanji.find_by(text: params['kanji'])}
  end 
  def questtion
    @word = Word.get_word_by_category(1)
    @percent = self.percent(1)
    @kanjis = Kanji.get_kanjis_by_category(1)
    all_kanjis = Kanji.where(category_id: 1).pluck(:text)
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
