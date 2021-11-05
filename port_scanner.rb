#!/usr/bin/env ruby
# frozen_string_literal: true

require 'socket'

(1..1024).each do |port|
  conn = TCPSocket.new '192.168.0.200', port
  conn.close
  puts "#{port} open"
rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
end
