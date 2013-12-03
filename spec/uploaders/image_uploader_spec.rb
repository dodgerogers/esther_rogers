require "spec_helper"
require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    @post = create(:post)
    ImageUploader.enable_processing = true
    @uploader = ImageUploader.new(@post, :file)
    @uploader.store!(File.open(File.join(Rails.root, 'spec', 'support', 'images', 'image1.jpg')))
  end

  after do
    ImageUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 64 by 64 pixels" do
      @uploader.mini.should have_dimensions(100, 100)
    end
  end
  
  context "featured version" do
    it "should scale featured version to 200, 267 pixels" do
      @uploader.featured.should have_dimensions(200, 267)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0644)
  end
end