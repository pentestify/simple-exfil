require 'socket'

server = TCPServer.new(2000)
loop do
  Thread.start(server.accept) do |socket|
    socket.puts "OK"
    socket.close
  end
end
