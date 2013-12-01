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
end