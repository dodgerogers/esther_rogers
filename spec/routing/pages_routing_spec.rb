require "spec_helper"

describe PagesController do
  it "routes to #about" do
    get("/about").should route_to("pages#about")
  end
  
  it "routes to #contact" do
    get("/contact").should route_to("pages#contact")
  end
  
  it "routes to #sitemap html" do
    get("/sitemap").should route_to("pages#sitemap")
  end
  
  it "routes to #sitemap xml" do
    get("/sitemap.xml").should route_to("pages#sitemap", format: "xml")
  end
end