class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :band
  include PublicActivity::Model
  tracked only: [:create], :owner => :band
end
