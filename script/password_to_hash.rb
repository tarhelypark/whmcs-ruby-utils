require 'digest'

if ARGV.length != 1
  puts "Please give me a password to convert!"
  exit 1
end
puts "md5 hash of your password:"
puts Digest::MD5.hexdigest ARGV[0]
