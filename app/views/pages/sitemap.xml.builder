xml.instruct!
xml.urlset "xmlns" => "https://www.sitemaps.org/schemas/sitemap/0.9" do
  
  xml.url do
    xml.loc root_url
    xml.priority 1.0
  end
  
  @static_pages.each do |page|
    xml.url do
      xml.loc "#{page}"
      xml.changefreq("monthly")
    end
  end
  
  @posts.each do |post|
    xml.url do
      xml.loc "#{post_url(post)}"
      xml.lastmod post.created_at.strftime("%F")
      xml.changefreq("monthly")
    end
  end
  
  @tags.each do |tag|
    xml.url do
      xml.loc "#{category_path(tag.name)}"
      xml.lastmod tag.created_at.strftime("%F")
      xml.changefreq("monthly")
    end
  end
end
  
  