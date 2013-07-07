class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :file_path
      t.datetime :date
      t.string :location

      t.timestamps
    end
  end
end
