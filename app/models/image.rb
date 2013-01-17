class Image < ActiveRecord::Base
  attr_accessible :title, :description, :source_url
  before_create :before

  private
  def before
    self.url = self.source_url unless source_url.blank?
  end
end
