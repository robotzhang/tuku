class CreateAlbumImages < ActiveRecord::Migration
  def change
    create_table :album_images do |t|

      t.timestamps
    end
  end
end
