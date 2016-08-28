class Title < ActiveRecord::Base
  belongs_to :title_type

  validates :external_id, uniqueness: true
end
