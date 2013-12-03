require "spec_helper"

describe "Posts" do
  before(:each) do
    PostsController.any_instance.stub(:authenticate).and_return(true)
    PostsController.any_instance.stub(:current_user).and_return(true)
  end
  
  it "GET request returns 200" do
    get dashboard_path
    response.status.should be(200)
  end
  
  describe "POST create"
    describe "with valid params" do
      it "creates post" do
        visit dashboard_path
        click_link "Create New Post"
        attach_file("post_featured_image", File.join(Rails.root, 'spec', 'support', 'images', 'image1.jpg'))
        fill_in "Title", with: "Fashion and Beauty"
        fill_in "Tag list", with: "fashion"
        fill_in "Body", with: ("a"*100)
        expect {
          click_button "Save"
        }.to change(Post, :count).by(1)
        page.should have_content("Fashion and Beauty")
      end
    end
  
  describe "with invalid params" do
    it "fails to create question" do
      visit dashboard_path
      click_link "Create New Post"
      attach_file("post_featured_image", File.join(Rails.root, 'spec', 'support', 'images', 'image1.jpg'))
      fill_in "Title", with: ""
      fill_in "Tag list", with: ""
      fill_in "Body", with: ("a"*100)
      expect {
        click_button "Save"
      }.to_not change(Post, :count).by(1)
      page.should_not have_content("Fashion and Beauty")
    end
  end
  
  describe "PATCH update" do
    describe "with valid params" do
      it "updates post" do
        visit dashboard_path
        click_link "Create New Post"
        attach_file("post_featured_image", File.join(Rails.root, 'spec', 'support', 'images', 'image1.jpg'))
        fill_in "Title", with: "Fashion and Beauty"
        fill_in "Tag list", with: "Fashion"
        fill_in "Body", with: ("a"*100)
        click_button "Save"
        page.should have_content("Fashion and Beauty")
        click_link "Edit"
        page.should have_content "Editing post"
        fill_in "Title", with: "Fashion and Style"
        click_button "Save"
        page.should have_content "Fashion and Style"
      end
    end
    
    describe "with invalid params" do
      it "updates post" do
        visit dashboard_path
        click_link "Create New Post"
        attach_file("post_featured_image", File.join(Rails.root, 'spec', 'support', 'images', 'image1.jpg'))
        fill_in "Title", with: "Fashion and Beauty"
        fill_in "Tag list", with: "Fashion"
        fill_in "Body", with: ("a"*100)
        click_button "Save"
        page.should have_content("Fashion and Beauty")
        click_link "Edit"
        page.should have_content "Editing post"
        fill_in "Title", with: ""
        click_button "Save"
        page.should_not have_content "Fashion and Style"
      end
    end
  end
  
  describe "Unauthorized" do
    it "status code 401" do
      PostsController.any_instance.stub(:authenticate).and_return(false)
      get dashboard_path
      expect {
        response.status should be("Unauthorized")
      }
    end
  end
end