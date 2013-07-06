class CreateGalleryships < ActiveRecord::Migration
  def change
    create_table :galleryships do |t|
      t.integer :gallery_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
