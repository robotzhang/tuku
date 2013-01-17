#coding=utf-8
class Admin::AlbumsController < ApplicationController
  before_filter do |controller|
    controller.authenticated({:role => 'admin', :alert=>'不具备的权限'})
  end
  layout 'admin'
  def index
    @albums = Album.order(:id).page(params[:page])
  end
  def new
    @album = Album.new
    render :template => 'admin/albums/form'
  end
  def create
    @album = Album.new(params[:album])
    @album.save ? redirect_to(:action => :index) : render(:template => 'admin/albums/form')
  end
  def edit
    @album = Album.find(params[:id])
    render :template => 'admin/albums/form'
  end
  def update
    @album = Album.find(params[:id])
    @album.update_attributes(params[:album]) ? redirect_to(:action => :index) : render(:template => 'admin/albums/form')
  end
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to :action => :index
  end
  def show
    @album = Album.find(params[:id])
  end
end
