class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :band
  has_many :article_photos, dependent: :destroy
  accepts_nested_attributes_for :article_photos, allow_destroy: true, :reject_if => lambda { |a| a[:image].blank? }

  has_reputation :votes, source: :user, aggregated_by: :sum
  has_many :article_comments, dependent: :destroy
  include PublicActivity::Model
  tracked only: [:create], :owner => :band
end
