require "spec_helper"

describe ApplicationHelper do
  before(:each) do
    @post = create(:post)
    @post.attachments.build
    form_for(@post, url: new_post_path(@post)) { |f| @builder = f }
  end
  
  describe "link_to_add_fields" do
    it "returns formatted html" do
      helper.link_to_add_fields("Add", @builder, :attachments).should be_a(String)
    end
  end
  
  describe "meta helpers" do
    describe "meta_title" do
      it "returns default meta title" do
        helper.meta_title.should eq META_CONFIG["title"]
      end
    end
    
    describe "meta_description" do
      it "returns default description" do
        helper.meta_description.should eq META_CONFIG["description"]
      end
    end
    
    describe "meta_keywords" do
      it "returns default keywords" do
        helper.meta_keywords.should eq META_CONFIG["keywords"]
      end
    end
  end
end