class StaticPagesController < ApplicationController
  def home
  	@bands = Band.all
  	@albums = Album.all
  	@songs = Song.all
  end


  def help
  end

  def sign_up_success
  end
end
