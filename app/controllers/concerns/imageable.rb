module Imageable
  extend ActiveSupport::Concern
  
  included do
    before_action :new_attachment, only: [:new, :edit]
  end
  
  def new_attachment
    @attachment = Attachment.new
  end
end