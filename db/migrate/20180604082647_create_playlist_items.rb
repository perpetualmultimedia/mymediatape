class CreatePlaylistItems < ActiveRecord::Migration[5.0]
  def change
    create_table :playlist_items do |t|
      t.references :playlist
      t.integer :song_id
      t.string :url
      t.string :title
      t.string :album_name
      t.string :artist_name
      t.integer :artist
      t.integer :album
      t.string :album_art_url

      t.timestamps
    end
  end
end
