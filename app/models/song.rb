class Song < ActiveRecord::Base
  has_reputation :votes, source: :user, aggregated_by: :sum
  belongs_to :album
  has_attached_file :audio_file
  validates_attachment_content_type :audio_file, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
  default_scope { order("track_number") }
  
end
