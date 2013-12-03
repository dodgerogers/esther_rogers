require "spec_helper"

describe TagsHelper do
  before(:each) do
    @post = create(:post)
  end
  
  describe "display_tags" do
    it "returns formatted html" do
      helper.display_tags(@post.tags).should eq "<a class=\"\" href=\"/category/Fashion\">Fashion</a>"
    end
  end
end