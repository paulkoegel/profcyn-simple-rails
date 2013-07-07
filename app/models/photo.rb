class Photo < ActiveRecord::Base

  has_many :galleryships
  has_many :galleries, through: :galleryships

  def dropbox_path
    "http://dl.dropbox.com/u/3374145/profcyn/#{self.file_path}"
  end

  def development_path(*gallery)
    "/galleries/#{self.file_path}"
  end

  def file_name
    self.file_path.split('/').last
  end

  def file_extension
    self.file_name.split('.').last
  end

  def url
    Rails.env.production? ? self.dropbox_path : self.development_path
  end

end
