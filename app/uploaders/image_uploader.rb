# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  
  def extension_white_list
      %w(jpg jpeg)
  end

  # Override the directory where uploaded files will be stored.
  def store_dir
    if Rails.env.test? 
      "test/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    else
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end
  
  version :mini do
    process resize_to_fill: [100, 100]
  end

  version :featured, if: :is_post? do
    process resize_to_fill: [200, 267]
  end
  
  before :store, :remember_cache_id
  after :store, :delete_tmp_dir

  # store! nil's the cache_id after it finishes so we need to remember it for deletion
  def remember_cache_id(new_file)
    @cache_id_was = cache_id
  end

  def delete_tmp_dir(new_file)
    # make sure we don't delete other things accidentally by checking the name pattern
    if @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
      FileUtils.rm_rf(File.join(root, cache_dir, @cache_id_was))
    end
  end
  
  protected
  
  def is_post?(picture)
    model.class.to_s == "Post"
  end
end
