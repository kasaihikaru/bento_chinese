class FoldSentence < ActiveRecord::Base
  belongs_to :fold
  belongs_to :sentence
end
