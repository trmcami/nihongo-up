class User < ActiveRecord::Base
  include Clearance::User

  has_many :difficulty_ratings
  has_many :rated_titles, through: :difficulty_ratings, source: :title
end
