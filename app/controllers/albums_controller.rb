class AlbumsController < ApplicationController
  def show
    @album = Album.find_by_seo_url(params[:seo_url], :first)
  end
end
