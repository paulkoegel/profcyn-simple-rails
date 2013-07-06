class Photo < ActiveRecord::Base
  has_many :galleryships
  has_many :galleries, through: :galleryships
end
