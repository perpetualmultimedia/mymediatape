class AddMeritFieldsToBands < ActiveRecord::Migration
  def change
    add_column :bands, :sash_id, :integer
    add_column :bands, :level,   :integer, :default => 0
  end
end
