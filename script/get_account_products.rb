path = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift "#{path}/../../whmcs-ruby-api/lib/"

require 'whmcs-api'
load 'lib/base.rb'

#p WHMCS::Client.get_clients_details(:clientid => '5')
products = WHMCS::Client.get_clients_products(username2: ARGV[0])
exit 1 if products[:products].empty?
puts JSON.pretty_generate products
