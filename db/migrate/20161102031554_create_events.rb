class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :band
      t.string :title
      t.string :date
      t.string :time
      t.string :description
      t.string :address
      t.string :city
      t.string :state
      t.string :ticket_link

      t.timestamps null: false
    end
  end
end
