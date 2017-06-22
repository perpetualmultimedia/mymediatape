class Song < ActiveRecord::Base
  belongs_to :album
  has_reputation :votes, source: :user, aggregated_by: :sum
  has_attached_file :audio_file
  validates_attachment_content_type :audio_file, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
  default_scope { order("track_number") }
  validates_presence_of :title, :track_number
end
