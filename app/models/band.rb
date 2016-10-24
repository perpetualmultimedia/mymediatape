class Band < ActiveRecord::Base
  belongs_to :user
  has_many :songs
  has_many :collections
end