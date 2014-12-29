# Be sure to restart your server when you modify this file
Encoding.default_external = Encoding.default_internal = Encoding::UTF_8 if defined? Encoding

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.18' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.

  config.active_record.default_timezone = :utc

  config.action_mailer.delivery_method = :smtp

end
ActionController::Base.cache_store = :file_store, "#{Rails.root}/tmp/cache"

logfile = File.open('/home/aoi/allourideas.org/log/env.log', 'a')  
my_logger = Logger.new(logfile)
my_logger.info '~~~~ IN PROCESS:'
my_logger.info $PROGRAM_NAME
my_logger.info '     '
my_logger.info ENV
my_logger.info '     '

