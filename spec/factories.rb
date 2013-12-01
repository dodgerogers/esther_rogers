FactoryGirl.define do
  factory :post do 
    title "Fashion beauty"
    keywords "fashion, beauty, glamout"
    body "text about fashion and beauty"
  end
  
  factory :attachment do |f|
    f.file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'image1.jpg')) }
    f.filename "image1.jpg"
  end
end