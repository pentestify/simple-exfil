require "socket"
s = TCPSocket.open("localhost", ARGV[0])
s.puts "test"
while line = s.gets
    puts "received : #{line.chop}"
end
s.close