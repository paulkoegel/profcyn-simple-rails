class Galleryship < ActiveRecord::Base
  belongs_to :gallery, counter_cache: :photos_count 
  belongs_to :photo
end
