class Song < ActiveRecord::Base
  belongs_to :album
  has_attached_file :audio_file
  validates_attachment_content_type :audio_file, :content_type => ['audio/mpeg']
  default_scope { order("track_number") }
end
