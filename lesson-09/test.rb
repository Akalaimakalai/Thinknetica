require_relative 'acсessors'

class Test
  extend Acсessors

  attr_accessor_with_history :a, :b, :c
end

test = Test.new

test.a = 1
test.b = 2
test.c = 3

test.a = 34
test.b = 5
test.c = 16

test.a = :ololosh
test.b = "fuck"
test.c = nil

test.a = 8
test.b = 11
test.c = 66

#test.b_array

print "#{test.instance_variables}\n"

puts test.instance_variable_get(:@a)
test.instance_variable_set(:@a, 17)
puts test.instance_variable_get(:@a)

print "#{test.instance_variable_get(:@a_arr)}\n"
print "#{test.instance_variable_get(:@b_arr)}\n"
print "#{test.instance_variable_get(:@c_arr)}\n"





