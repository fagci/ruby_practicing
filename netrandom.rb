#!/usr/bin/env ruby
# frozen_string_literal: true

require 'socket'

def gen_ip
  intip = rand(0x1000000..0xE0000000)
  while intip.between?(0xA000000, 0xAFFFFFF) ||
        intip.between?(0x64400000, 0x647FFFFF) ||
        intip.between?(0x7F000000, 0x7FFFFFFF) ||
        intip.between?(0xA9FE0000, 0xA9FEFFFF) ||
        intip.between?(0xAC100000, 0xAC1FFFFF) ||
        intip.between?(0xC0000000, 0xC0000007) ||
        intip.between?(0xC00000AA, 0xC00000AB) ||
        intip.between?(0xC0000200, 0xC00002FF) ||
        intip.between?(0xC0A80000, 0xC0A8FFFF) ||
        intip.between?(0xC6120000, 0xC613FFFF) ||
        intip.between?(0xC6336400, 0xC63364FF) ||
        intip.between?(0xCB007100, 0xCB0071FF) ||
        intip.between?(0xF0000000, 0xFFFFFFFF)
    intip = rand(0x1000000..0xE0000000)
  end
  [intip].pack('N').unpack('CCCC').join('.')
end

workers = (0..1024).map do
  Thread.new do
    loop do
      ip = gen_ip
      begin
        TCPSocket.new(ip, 80, connect_timeout: 1).close
        puts "#{ip}:80"
      rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
      end
    end
  end
end

workers.map(&:join)
