class DifficultyRating < ActiveRecord::Base
  belongs_to :title
  belongs_to :user
  belongs_to :difficulty
end
