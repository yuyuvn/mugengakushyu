class Result < ActiveRecord::Base
  belongs_to :test
  belongs_to :answer
end
