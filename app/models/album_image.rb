class AlbumImage < ActiveRecord::Base
  attr_accessible :image_id, :album_id
  belongs_to :album
  belongs_to :image
end
