#!/usr/bin/env ruby
# frozen_string_literal: true

res = []
ng_len = 2

ARGF.read.downcase.split(/\W+/).map do |word|
  wlen = word.length
  (wlen - ng_len + 1).times do |i|
    res.append(word[i, ng_len])
  end
end

sorted = res.tally.sort_by { |_, c| -c }.map(&:first)
puts sorted
