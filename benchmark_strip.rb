#!/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'

STR = "Some string\r\n".freeze

Benchmark.bm do |b|
  b.report 'Chomp' do
    1_000_000.times do
      STR.chomp
    end
  end

  b.report 'Strip' do
    1_000_000.times do
      STR.strip
    end
  end

  b.report 'RStrip' do
    1_000_000.times do
      STR.rstrip
    end
  end

  b.report 'Delete' do
    1_000_000.times do
      STR.delete("\r\n")
    end
  end

  b.report 'Sub' do
    1_000_000.times do
      STR.sub(/\s+$/, '')
    end
  end
end
