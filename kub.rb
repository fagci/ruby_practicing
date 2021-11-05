#!/usr/bin/env ruby

(102..987)
  .each {
    |n|
    kub = n.digits.uniq.reverse
    if kub.length==3 and kub.sum**3==n
      puts "(" + kub.join("+") + ")^3=" + n.to_s
    end
}
