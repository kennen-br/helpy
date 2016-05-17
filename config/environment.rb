# Load the Rails application.
require File.expand_path('../application', __FILE__)

FlashKick.load_variables

# Initialize the Rails application.
Rails.application.initialize!

# Get the current tag version
APP_VERSION = `git describe --tags` unless defined? APP_VERSION
