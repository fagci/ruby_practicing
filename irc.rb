#!/usr/bin/env ruby
# frozen_string_literal: true

require 'socket'

nick = 'fagci-ruby'
chats = %w[#networking #bash]

client = TCPSocket.new 'irc.libera.chat', 6667

client.puts "NICK #{nick}"
client.puts "USER #{nick} * #{nick} :ruby bot"

chats.each { |chat| client.puts "JOIN #{chat}" }

begin
  while (line = client.gets)
    puts line

    client.puts line.sub('I', 'O') if line.start_with? 'PING'
  end
rescue Interrupt
  puts 'Exiting'
end

at_exit do
  client.puts 'QUIT'
  client.close
end
