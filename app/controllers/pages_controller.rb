class PagesController < ApplicationController

  def start
    @photos = Gallery.first.photos
  end

end
