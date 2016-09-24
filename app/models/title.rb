class Title < ActiveRecord::Base
  belongs_to :title_type
  has_many :difficulty_ratings

  has_many :rated_by, through: :difficulty_ratings, source: :user

  validates :external_id, uniqueness: true
end
