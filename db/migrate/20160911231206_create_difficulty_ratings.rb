class CreateDifficultyRatings < ActiveRecord::Migration
  def change
    create_table :difficulty_ratings do |t|
      t.references :title, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.integer :difficulty_id
    end
  end
end
