require "spec_helper"

describe Tag do
  before(:each) do
    @tag = create(:tag)
  end
  
  subject { @tag }
  
  it { should respond_to(:name) }
  it { should have_many(:taggings) }
  it { should have_many(:posts) }
end