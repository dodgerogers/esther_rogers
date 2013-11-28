require "spec_helper"

describe Post do
  before(:each) do
    @post = create(:post)
  end
  
  subject { @post }
  
  it { should respond_to(:title) }
  it { should respond_to(:keywords) }
  it { should respond_to(:body) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end