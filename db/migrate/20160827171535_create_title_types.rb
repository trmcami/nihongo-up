class CreateTitleTypes < ActiveRecord::Migration
  def change
    create_table :title_types do |t|
      t.string :name
    end
  end
end
