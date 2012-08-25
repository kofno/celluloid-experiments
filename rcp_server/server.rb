require 'socket'
require 'celluloid'

class Responder
  include Celluloid

  def initialize(client)
    @client = client
  end

  def handle_connection
    while line = @client.gets
      @client.puts eval(line)
    end
  ensure
    @client.close
  end
end

server = TCPServer.new ARGV[0].to_i
puts "Listening on port #{ARGV[0]}"
loop do
  client = server.accept
  responder = Responder.new client
  responder.handle_connection!
end


