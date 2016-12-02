class AddAttachmentImageToArticlePhotos < ActiveRecord::Migration
  def self.up
    change_table :article_photos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :article_photos, :image
  end
end
