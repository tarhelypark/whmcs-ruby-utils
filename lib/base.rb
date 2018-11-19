require 'yaml'

config_name = 'whmcs-ruby-utils.conf.yml'
path = File.expand_path(File.dirname(__FILE__) + "/../#{config_name}")
etc_config = "/etc/whmcs-ruby-utils.conf.yml"

if File.exists? path
  yaml_config = YAML.load_file path
elsif File.exists? etc_config
  yaml_config = YAML.load_file etc_config
else
  puts "Config file not found:"
  puts path
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
