class Answer < ActiveRecord::Base
  belongs_to :test
  belongs_to :kanji
end
