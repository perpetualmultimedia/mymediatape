class Event < ActiveRecord::Base
	belongs_to :band
	has_attached_file :flyer, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :flyer, content_type: /\Aimage\/.*\z/
  	default_scope { order(date: :desc) }
end
