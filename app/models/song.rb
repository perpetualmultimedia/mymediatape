class Song < ActiveRecord::Base
  belongs_to :collection
  belongs_to :band
end
