# truncate all database tables except schema_migrations
if Rails.env.development?
  ActiveRecord::Base.establish_connection
  ActiveRecord::Base.connection.tables.delete_if{|table| table == 'schema_migrations'}.each do |table|
    ActiveRecord::Base.connection.execute "TRUNCATE #{table}"
  end
end


gallery = Gallery.create title: 'Hong Kong 2013', date: Date.parse('2013-04-01')

image_paths = []
187.times do |i|
  gallery.photos << Photo.new(dropbox_path: "http://dl.dropbox.com/u/3374145/profcyn/2013-04_hong_kong/#{'%03d' % (i+1)}.jpg")
end

gallery.save
