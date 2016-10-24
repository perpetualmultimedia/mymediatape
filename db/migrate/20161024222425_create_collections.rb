class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.string :type
      t.string :released
      t.string :description
      t.references :band, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
