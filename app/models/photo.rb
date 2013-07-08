class Photo < ActiveRecord::Base

  has_many :galleryships
  has_many :galleries, through: :galleryships

  DROPBOX_BASE_URL = "http://dl.dropbox.com/u/3374145/profcyn"

  def file_path_small
    "#{self.file_path.split('/').first}/small/#{self.file_path.split('/').last}"
  end

  def dropbox_url
    "#{DROPBOX_BASE_URL}/#{self.file_path}"
  end

  def dropbox_url_small
    "#{DROPBOX_BASE_URL}#{self.file_path_small}"
  end

  def development_path
    "/galleries/#{self.file_path}"
  end

  def development_path_small
    "/galleries/#{self.file_path_small}"
  end

  def file_name
    self.file_path.split('/').last
  end

  def file_extension
    self.file_name.split('.').last
  end

  def url
    Rails.env.production? ? self.dropbox_url : self.development_path
  end

  def url_small
    Rails.env.production? ? self.dropbox_url_small : self.development_path_small
  end

end
