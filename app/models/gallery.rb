class Gallery < ActiveRecord::Base
  has_many :galleryships
  has_many :photos, through: :galleryships
end
