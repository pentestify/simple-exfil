require "socket"

###
### Iterate through the available ports
###
(1023..65535).each do |port|
  socket = TCPSocket.open("exfil.pwnieexpress.com", port)
  begin
    until socket.eof?
      line = socket.gets
      puts "#{port} open." if line
    end
  rescue Errno::ETIMEDOUT => e
    puts "Timed out on port #{port}"
  rescue Errno::ECONNRESET => e
    puts "#{port} reset our connection."
  rescue IOError => e
    puts "#{port} closed prematurely."
  ensure
    #socket.shutdown
    socket.close
  end
end