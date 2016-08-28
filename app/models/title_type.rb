class TitleType < ActiveRecord::Base
  has_many :titles

  validates :name, uniqueness: true
end
