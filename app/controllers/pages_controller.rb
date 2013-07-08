class PagesController < ApplicationController

  def start
    @photos = Gallery.find_by(directory: 'urban_exploration_2012').photos.order('RANDOM()').limit(20)
  end

end
