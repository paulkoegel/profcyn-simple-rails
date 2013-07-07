# truncate all database tables except schema_migrations
if Rails.env.development?
  ActiveRecord::Base.establish_connection
  ActiveRecord::Base.connection.tables.delete_if{|table| table == 'schema_migrations'}.each do |table|
    ActiveRecord::Base.connection.execute "TRUNCATE #{table}"
  end
end

base_path = Rails.root.join('public', 'galleries')
gallery_paths = Dir["#{base_path}/*"]

gallery_paths.each do |gallery_path|
  directory = gallery_path.split('/').last
  date = Date.parse(/\d+/.match(gallery_path).to_s) rescue nil
  gallery = Gallery.create title: directory.humanize.titleize, date: date, directory: directory

  photo_paths = Dir["#{gallery_path}/*"]
  photo_paths.each do |photo_path|
    file_path = "#{directory}/#{photo_path.split('/').last}"
    gallery.photos.create file_path: file_path
  end
end
