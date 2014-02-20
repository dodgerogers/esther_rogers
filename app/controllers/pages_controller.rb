class PagesController < ApplicationController
  include Postable
  
  def home
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).order("created_at").to_a.paginate(page: params[:page], per_page: 8)
    end
  end
  
  def sitemap
    @posts = Post.order("created_at desc")
    @tags = Tag.order(:name)
    @static_pages = [root_url, contact_url, about_url]
    respond_to do |format|
      format.html
      format.xml
    end
  end
  
  def about
  end
  
  def contact
  end
end
