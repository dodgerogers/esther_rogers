require "spec_helper"

describe PagesController do
  before(:each) do
    @post = create(:post)
  end
  
  subject { PagesController }
  
  describe "GET home" do    
    it "renders home template" do
      get :home
      response.should render_template :home
    end
    
    describe "params[:tag]" do
      it "returns array of tagged posts" do
        get :home, tag: "Fashion"
        controller.params[:tag].should eq "Fashion"
      end
    end
  end
  
  describe "GET contact" do
    it "renders contact template" do
      get :contact
      response.should render_template :contact
    end
  end
  
  describe "GET about" do
    it "renders about template" do
      get :about
      response.should render_template :about
    end
  end
  
  describe "GET sitemap" do
    it "renders sitemap html template" do
      get :sitemap
      response.should render_template :sitemap
    end
    
    it "renders sitemap xml template" do
      get :sitemap, format: :xml
      response.should render_template :sitemap
    end
  end
end