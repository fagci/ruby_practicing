#!/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'

STR = 'Some string'.freeze

Benchmark.bm do |b|
  b.report 'Include' do
    1_000_000.times do
      STR.include? 'e s'
    end
  end

  b.report 'Regexp' do
    1_000_000.times do
      STR =~ /e s/
    end
  end

  b.report 'Match' do
    1_000_000.times do
      STR.match('e s')
    end
  end
end
