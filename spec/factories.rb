FactoryGirl.define do
  factory :post do
    title "Fashion beauty"
    keywords "fashion, beauty, glamout"
    body "text about fashion and beauty"
    tag_list { create(:tag).name }
  end
  
  factory :attachment do |f|
    f.file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'image1.jpg')) }
    f.filename "image1.jpg"
  end
  
  factory :tag do
    name "Fashion"
  end
end