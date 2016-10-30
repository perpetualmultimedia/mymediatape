class User < ActiveRecord::Base
  def show
  end
  def index
  end
  def follow(band)

    active_relationships.create(followed_id: band.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(band)
    following.include?(band.id)
  end
  def user_params
  params.require(:user).permit(:avatar)
end
end