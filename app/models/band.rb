class Band < ActiveRecord::Base
  extend FriendlyId
  friendly_id :handle, use: :slugged
  has_merit
  has_reputation :votes, source: :user, aggregated_by: :sum
  belongs_to :user
  has_many :albums, dependent: :destroy
  has_many :songs, through: :albums, dependent: :destroy
  has_many :events
  has_many :articles
  has_many :members, dependent: :destroy
  accepts_nested_attributes_for :songs, allow_destroy: true, :reject_if => lambda { |a| a[:title].blank? }
  has_attached_file :band_avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :band_avatar, content_type: /\Aimage\/.*\z/

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy  
  has_many :followers, through: :passive_relationships, source: :follower                                                              
  validates_presence_of :group_name, :city, :state, :handle
  validates_uniqueness_of :handle
  validates_associated :members
  accepts_nested_attributes_for :events, allow_destroy: true
  accepts_nested_attributes_for :albums, allow_destroy: true
  accepts_nested_attributes_for :members, allow_destroy: true, reject_if: :all_blank
end