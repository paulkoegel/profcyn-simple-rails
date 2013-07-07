class PagesController < ApplicationController

  def start
    @photos = Gallery.first.try(:photos)
  end

end
