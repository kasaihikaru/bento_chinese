class Sentence < ActiveRecord::Base
  has_many :words
  accepts_nested_attributes_for :words
  belongs_to :user

  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :likes

  has_many :fold_sentences, dependent: :destroy
  has_many :folds, :through => :fold_sentences
  accepts_nested_attributes_for :fold_sentences, allow_destroy: true

  validates :ja, presence: true
  validates :ch, presence: true

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
