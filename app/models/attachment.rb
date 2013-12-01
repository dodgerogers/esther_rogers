class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  mount_uploader :file, ImageUploader
  validates_presence_of :file
end
