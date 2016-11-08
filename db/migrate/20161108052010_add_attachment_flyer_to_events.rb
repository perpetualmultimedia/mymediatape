class AddAttachmentFlyerToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :flyer
    end
  end

  def self.down
    remove_attachment :events, :flyer
  end
end
