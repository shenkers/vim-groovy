require 'socket'

hostname = 'localhost'
port = 9999

puts 'opening socket'

s = TCPSocket.open(hostname, port)

puts 'writing hello'
s.puts 'hello'

puts 'waiting for response'
response = s.gets
puts response

puts 'closing socket'
s.close
