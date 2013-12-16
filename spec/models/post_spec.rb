require "spec_helper"

describe Post do
  before(:each) do
    @post = create(:post)
  end
  
  subject { @post }
  
  it { should respond_to(:title) }
  it { should respond_to(:keywords) }
  it { should respond_to(:body) }
  it { should respond_to(:featured_image) }
  it { should respond_to(:created_at) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  
  describe "tag_limit > 0" do
    before { @post.tags = [] }
    it { should_not be_valid }
  end
  
  describe "tagged_with" do
    it "returns array of tagged posts" do
      Post.tagged_with(@post.tags[0].name).should eq [@post]
    end
  end
  
  describe "tag_list" do
    it "GETS joins tags array with ', '" do
      @post.tag_list.should eq @post.tags[0].name # Fashion
    end
  end
end