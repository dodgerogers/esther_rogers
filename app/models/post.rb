class Post < ActiveRecord::Base
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :taggings
  
  accepts_nested_attributes_for :attachments, allow_destroy: true
  
  mount_uploader :featured_image, ImageUploader
  validates_presence_of :title, :body
  
  #validate :tag_limit
  
  #def tag_limit
  #  errors.add(:base, "You need to specify at least one tag") if self.tags.size < 1 
  #end
  
  def to_param
    "#{self.id} - #{self.title}".parameterize
  end
  
  def self.tagged_with(name)
    Tag.where(name: name)[0].posts
  end
  
  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
