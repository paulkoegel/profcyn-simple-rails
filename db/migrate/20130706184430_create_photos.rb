class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.datetime :date
      t.string :location
      t.text :dropbox_path

      t.timestamps
    end
  end
end
