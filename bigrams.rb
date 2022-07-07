#!/usr/bin/env ruby
# frozen_string_literal: true

N = 2

b = ARGF.read.downcase.scan(/\w+/).flat_map do |word|
  word.chars.each_cons(N).map(&:join)
end

puts b.tally.sort_by { |_, c| -c }.map(&:first)
