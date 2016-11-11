class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :evaluations, class_name: "ReputationSystem::Evaluation", as: :source
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_many :bands

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy


  has_many :following, through: :active_relationships, source: :followed
  
    # Follows a user.
  def follow(band)
    active_relationships.create(followed_id: band.id)
  end

  # Unfollows a user.
  def unfollow(band)
    active_relationships.find_by(followed_id: band.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(band)
    following.include?(band)
  end
  def feed
  	following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :band_id"
    Album.where("band_id IN (#{following_ids})
                     OR band_id = :band_id", band_id: id)
    Event.where("band_id IN (#{following_ids})
                     OR band_id = :band_id", band_id: id)
  end
  def voted_for?(band)
    evaluations.where(target_type: band.class, target_id: band.id).present?
  end

end
