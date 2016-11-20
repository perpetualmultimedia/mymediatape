class AddBandIdToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :band_id, :integer
  end
end
