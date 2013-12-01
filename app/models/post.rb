class Post < ActiveRecord::Base
  mount_uploader :featured_image, ImageUploader
  validates_presence_of :title, :body
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true
end
