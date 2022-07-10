#!/usr/bin/env ruby
# frozen_string_literal: true

require 'socket'

nick = 'fagci-ruby'
chats = %w[#networking #bash]

TCPSocket.open('irc.libera.chat', 6667) do |client|
  client.puts "NICK #{nick}"
  client.puts "USER #{nick} * #{nick} :ruby bot"

  chats.each { |chat| client.puts "JOIN #{chat}" }

  while (line = client.gets)
    puts line

    client.puts line.sub('I', 'O') if line.start_with? 'PING'
  end
rescue Interrupt
  puts 'Exiting'
ensure
  client.puts 'QUIT'
end
