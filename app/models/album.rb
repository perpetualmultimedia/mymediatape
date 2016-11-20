class Album < ActiveRecord::Base
  belongs_to :band
  has_many :songs, dependent: :destroy
  has_reputation :votes, source: :user, aggregated_by: :sum
  include PublicActivity::Model
  tracked only: [:update, :create], :owner => :band
  accepts_nested_attributes_for :songs, allow_destroy: true, :reject_if => lambda { |a| a[:title].blank? }
  has_attached_file :album_art, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :album_art, content_type: /\Aimage\/.*\z/
  default_scope { order(released: :desc) }
end
