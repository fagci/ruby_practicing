#!/usr/bin/env ruby
# frozen_string_literal: true

require 'socket'

nick = 'fagci-ruby'

client = TCPSocket.new 'irc.libera.chat', 6667

client.puts "NICK #{nick}\r\n"
client.puts "USER #{nick} * #{nick} :ruby bot\r\n"
client.puts "JOIN #networking\r\n"
client.puts "JOIN #bash\r\n"

while line = client.gets
  puts line

  if line.start_with? 'PING'
    client.puts line.sub('I', 'O')
  end
end

client.close
