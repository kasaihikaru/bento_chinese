class Fold < ActiveRecord::Base

  has_many :fold_sentences, dependent: :destroy
  has_many :sentences, :through => :fold_sentences
  accepts_nested_attributes_for :fold_sentences, allow_destroy: true

  belongs_to :user

end
