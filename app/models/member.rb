class Member < ActiveRecord::Base
  belongs_to :band
  validates_presence_of :first_name
  
end
