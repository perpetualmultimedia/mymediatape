class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :group_name
      t.string :genre
      t.string :city
      t.string :state
      t.references :user, index: true, foreign_key: true
      t.string :description
      t.string :website

      t.timestamps null: false
    end
  end
end
