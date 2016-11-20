class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :band
  has_reputation :votes, source: :user, aggregated_by: :sum
  has_many :article_comments, dependent: :destroy
  include PublicActivity::Model
  tracked only: [:create], :owner => :band
end
