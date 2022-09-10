#!/usr/bin/env ruby
# frozen_string_literal: true

module M
  class C
    def self.inherited(sub)
      puts "#{sub} < #{self}"
    end

    def self.method_added(meth)
      puts "#{self}::#{meth}() added"
    end
  end

  def self.included(other)
    puts "#{other}: include #{self}"
  end
end

module M1
  include M
end

class Sub < M::C
  def method(); end
end
