class AddBandIdToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :band_id, :string
  end
end
