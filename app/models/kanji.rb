class Kanji < ActiveRecord::Base
    def self.get_kanjis_by_category category_id
       Kanji.find_by(category_id: category_id) 
    end
end
