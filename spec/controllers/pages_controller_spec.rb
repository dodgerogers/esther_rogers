require "spec_helper"

describe PagesController do
  subject { PagesController }
  
  describe "GET home" do    
    it "renders home template" do
      get :home
      response.should render_template :home
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
end