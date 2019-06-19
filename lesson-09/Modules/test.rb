require_relative 'acсessors'

class Test
  include Acсessors

  attr_accessor_with_history :a, :b, :c
  strong_attr_accessor :d, Integer
end

test = Test.new

test.a = 1
test.b = 2
test.c = 3

test.a = 34
test.b = 5
test.c = 16

test.a = :ololosh
test.b = "kek"
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

print "#{test.a_history}\n"
print "#{test.b_history}\n"
print "#{test.c_history}\n"

test.d = 5

puts test.instance_variable_get(:@d)
test.instance_variable_set(:@d, 42)
puts test.instance_variable_get(:@d)

test.d = 33
test.d = 68

print "#{test.d_history}\n"

test.d = "lol"

