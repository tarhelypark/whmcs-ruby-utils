path = File.expand_path(File.dirname(__FILE__))
load path + '/../lib/base.rb'

username = ARGV[0]
messagename = ARGV[1]

products = WHMCS::Client.get_clients_products(username2: username)
exit 1 if products[:products].empty?
product = products[:products][:product].first
puts WHMCS::Client.send_email(messagename: messagename, id: product[:id])
