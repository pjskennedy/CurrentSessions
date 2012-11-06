# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Currentsessions::Application.initialize!

ENV = YAML.load_file("#{::Rails.root}/config/config.yml") if not Rails.env.production?