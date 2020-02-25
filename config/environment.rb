# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#updatde the environment for cloudinary
config.active_storage.service = :cloudinary

