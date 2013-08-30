require 'socket'

server = TCPServer.new(2000)
loop do
  Thread.start(server.accept) do |socket|
    socket.puts "OK"
    socket.shutdown
    socket.close
    Thread.current.exit
  end
end
