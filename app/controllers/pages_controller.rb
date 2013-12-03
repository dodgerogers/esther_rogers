class PagesController < ApplicationController
  include Postable
  
  def home
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).order("created_at desc").paginate(page: params[:page], per_page: 4)
    end
  end
  
  def about
  end
  
  def contact
  end
end
