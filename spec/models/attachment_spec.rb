require "spec_helper"

describe Attachment do
  before(:each) do
    @post = create(:post)
    @attachment = create(:attachment, attachable: @post)
  end
  
  subject { @attachment }
  
  it { should respond_to(:attachable_type) }
  it { should respond_to(:attachable_id) }
  it { should respond_to(:file) }
  it { should respond_to(:filename) }
  it { should belong_to(:attachable) }
end