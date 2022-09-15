#!/usr/bin/env ruby
# frozen_string_literal: true

# Colorize
class String
  def red!
    replace "\e[31m#{self}\e[0m"
  end
end

# Helper methods
class Time
  def weekend?
    sunday? || saturday?
  end

  def today?
    date_s == Time.now.date_s
  end

  def date_s
    strftime('%Y-%m-%d')
  end

  def time_s
    strftime('%H:%M')
  end

  def cal
    s = strftime('%d %a')
    s << " <- #{Time.now.time_s}" if today?
    s.red! if weekend?
    s
  end
end

# Date with days manipulation, range support
class Date < Time
  class << self
    def now
      dt = Time.now
      new(dt.year, dt.mon, dt.mday)
    end
  end
  def next
    self + 1
  end

  def +(other)
    self.class.at(to_i + 86_400 * other)
  end

  def -(other)
    self.class.at(to_i - 86_400 * other)
  end

  alias succ next
end

range = (Date.now - 15...Date.now + 15)

cal = range.map(&:cal)

puts cal
