class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :location
      t.string :directory
      t.integer :photos_count
      t.datetime :date

      t.timestamps
    end
  end
end
