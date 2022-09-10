#!/usr/bin/env ruby
# frozen_string_literal: true

require 'test/unit'
require_relative 'bigrams'

class BigramsTest < Test::Unit::TestCase
  def test_bigrams
    b = bigrams('test string')
    expected = ['st', 'tr', 'te', 'es', 'ri', 'in', 'ng']
    assert_equal expected, b
  end
end
