class State < ActiveRecord::Base
  has_many :users
  has_many :bands
end