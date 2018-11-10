class AddFieldsToBands < ActiveRecord::Migration[5.0]
  def change
    add_column :bands, :handle, :string
    add_column :bands, :store, :string
  end
end
