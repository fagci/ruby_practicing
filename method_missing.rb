#!/usr/bin/env ruby
# frozen_string_literal: true

class DataSet < Array
  def columns(names)
    @columns = names
  end

  def method_missing(name, *args)
    return where($1.to_sym, *args) if name =~ /where_(.+)/
    super
  end

  def where(col, *args)
    idx = @columns.find_index(col)
    self.filter { |v| v[idx] == args[0] }
  end
end

ds = DataSet.new
ds.columns [:val, :status]

ds << ['first', 'ok']
ds << ['second', 'nok']
ds << ['third', 'ok']

pp ds.where_status('ok')
