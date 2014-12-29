# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Use a different logger for distributed setups
#config.logger = SyslogLogger.new

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"

# Disable delivery errors, bad email addresses will be ignored
config.action_mailer.raise_delivery_errors = false

ActiveSupport::XmlMini.backend = 'LibXML'
Paperclip.options[:command_path] = "/usr/bin/"

config.log_level = :debug

arLog = File.open('/home/aoi/allourideas.org/log/activeRecord.log', 'a')  
arLogger = Logger.new(arLog)
ActiveRecord::Base.logger = arLogger
ActiveRecord::Base.logger.level = Logger::DEBUG

logfile = File.open('/home/aoi/allourideas.org/log/env.log', 'a')  
my_logger = Logger.new(logfile)
my_logger.info '~~~~ production.rb IN PROCESS:'
my_logger.info $PROGRAM_NAME
my_logger.info '     '
my_logger.info ENV
my_logger.info '     '

