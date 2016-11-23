class CreateAlbumComments < ActiveRecord::Migration[5.0]
  def change
    create_table :album_comments do |t|
      t.references :user, foreign_key: true
      t.references :album, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
