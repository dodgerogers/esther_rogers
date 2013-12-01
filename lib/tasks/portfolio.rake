namespace :db do
  task :carrierwave_cleanup do
    CarrierWave.clean_cached_files!
  end
end