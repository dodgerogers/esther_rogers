# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
EstherRaday::Application.initialize!

META_CONFIG = YAML.load_file("#{Rails.root}/config/meta.yml")