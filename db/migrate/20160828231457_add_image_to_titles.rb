class AddImageToTitles < ActiveRecord::Migration
  def change
    add_column :titles, :image, :string
  end
end
