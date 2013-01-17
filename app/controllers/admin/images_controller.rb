#coding=utf-8
class Admin::ImagesController < ApplicationController
  before_filter do |controller|
    controller.authenticated({:role => 'admin', :alert=>'不具备的权限'})
  end
  layout 'admin'
  def index
    @images = Image.order(:id).page(params[:page])
  end
  def new
    @image = Image.new
    render :template => 'admin/images/form'
  end
  def create
    @image = Image.new(params[:image])
    album = Album.find(params[:album_id]) unless params[:album_id].blank?
    if @image.save() && !album.blank?
      AlbumImage.create(:image_id => @image.id, :album_id => album.id)
      return redirect_to admin_album_url(album)
    end
    redirect_to :action => :index
  end
  def edit
    @image = Image.find(params[:id])
    render :template => 'admin/images/form'
  end
  def update
    @image = Image.find(params[:id])
    @image.update_attributes(params[:image])
    redirect_to :action => :index
  end
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to :action => :index
  end
end
