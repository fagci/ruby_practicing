#!/usr/bin/env ruby
# frozen_string_literal: true

ng_len = 2

b = ARGF.read.downcase.scan(/\w+/).map do |word|
  word.chars.each_cons(ng_len).map &:join
end

puts b.flatten.tally.sort_by { |_, c| -c }.map(&:first)
