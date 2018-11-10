class AddSlugToBands < ActiveRecord::Migration[5.0]
  def change
    add_column :bands, :slug, :string
  end
end
