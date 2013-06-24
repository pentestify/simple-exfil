require 'socket'

server = TCPServer.new(2000)
loop do
  Thread.start(server.accept) do |client|
    client.puts "OK"
    client.close
  end
end
