class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :track_number
      t.string :description
      t.references :collection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
