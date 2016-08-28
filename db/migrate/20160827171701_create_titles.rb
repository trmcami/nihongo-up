class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :name
      t.string :external_id
      t.text :summary
      t.datetime :last_sync
      t.references :title_type, foreign_key: true, index: true

      t.timestamps
    end
  end
end
