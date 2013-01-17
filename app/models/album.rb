#coding=utf-8
class Album < ActiveRecord::Base
  attr_accessible :name, :description, :seo_url
  validates_uniqueness_of :seo_url, :message => 'seo url必须唯一'
  validates_presence_of :name, :message => '相册名称不能为空'
  validates_uniqueness_of :name, :message => '相册名称必须唯一'

  has_many :album_images
  has_many :images, :through => :album_images
end
