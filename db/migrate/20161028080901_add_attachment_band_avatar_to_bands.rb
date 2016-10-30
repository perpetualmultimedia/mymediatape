class AddAttachmentBandAvatarToBands < ActiveRecord::Migration
  def self.up
    change_table :bands do |t|
      t.attachment :band_avatar
    end
  end

  def self.down
    remove_attachment :bands, :band_avatar
  end
end
