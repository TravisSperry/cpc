# frozen_string_literal: true

# Load the rails application
require File.expand_path('application', __dir__)

# Load the app's custom environment variables here, so that they are loaded before environments/*.rb
app_environment_variables = File.join(Rails.root, 'config', 'app_environment_variables.rb')
load(app_environment_variables) if File.exist?(app_environment_variables)

# Initialize the rails application
Cpc::Application.initialize!
