class Like < ActiveRecord::Base
  belongs_to :sentence, counter_cache: :likes_count
  belongs_to :user
end
