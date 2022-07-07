#!/usr/bin/env ruby
# frozen_string_literal: true

require 'socket'

(1..1024).each do |port|
  Socket.tcp('192.168.0.200', port, connect_timeout: 0.75).close
  puts "#{port} open"
rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
end
