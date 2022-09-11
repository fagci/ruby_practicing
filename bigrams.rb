#!/usr/bin/env ruby
# frozen_string_literal: true

N = 2

def bigrams(text)
  text
    .downcase
    .scan(/\w+/)
    .flat_map { |word| word.chars.each_cons(N).map(&:join) }
    .tally
    .sort_by { |_, c| -c }
    .map(&:first)
end

puts bigrams(ARGF.read) if __FILE__ == $0
