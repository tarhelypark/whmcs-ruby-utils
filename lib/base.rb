path = File.expand_path(File.dirname(__FILE__))
config_name = 'whmcs-ruby-utils.conf.yml'
config_path = path + "/../#{config_name}"
etc_config = "/etc/whmcs-ruby-utils.conf.yml"
api_path = "#{path}/../../whmcs-ruby-api/lib"


$LOAD_PATH.unshift api_path if File.exists? api_path

require 'whmcs-api'
require 'yaml'

if File.exists? config_path
  yaml_config = YAML.load_file config_path
elsif File.exists? etc_config
  yaml_config = YAML.load_file etc_config
else
  puts "Config file not found:"
  puts config_path
  puts etc_config
  exit 1
end

WHMCS.configure do |config|
  config.api_url      = yaml_config['api_url']
  config.api_username = yaml_config['api_username']
  config.api_password = yaml_config['api_password']
  # optionally add access key
  config.api_key = yaml_config['api_key']
end
