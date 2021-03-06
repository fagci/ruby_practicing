#!/usr/bin/env ruby
# frozen_string_literal: true

(102..987).each do |n|
  kub = n.digits.uniq.reverse
  next unless kub.length == 3 && kub.sum**3 == n

  puts "(#{kub.join '+'})^3=#{n}"
end
