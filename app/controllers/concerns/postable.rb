module Postable
  extend ActiveSupport::Concern
  
  included do
    before_filter :find_latest_posts, only: [:index, :home]
  end
  
  def find_latest_posts
    @posts = Post.order(created_at: :desc).includes(:tags).to_a.paginate(page: params[:page], per_page: 12)
  end
end