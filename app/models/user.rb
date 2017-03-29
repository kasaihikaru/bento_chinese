class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nickname, presence: true

  has_many :sentences
  has_many :likes
  has_many :folds

  has_attached_file :avatar,
                    :styles  => {original: "100x100#"}

  validates_attachment_content_type :avatar,
                                      content_type: ["image/jpg","image/jpeg","image/png"]



  def sentence_like(sentence_id)
    current_user.likes.where(sentence_id: sentence_id).select(:id)
  end
end
