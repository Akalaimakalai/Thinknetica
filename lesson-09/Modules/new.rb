require_relative 'validation'

class Foo
  include Validation

  attr_reader :name
  
  FORMAT = /^( |[a-z]){5,20}$/i

  def initialize(name)
    @name = name
  end
end

foo = Foo.new("ololosh")

puts foo.class.validate(foo.name, :presence)
puts foo.class.validate(foo.name, :format)
puts foo.class.validate(foo.class, :type)

#foo.validate!

puts foo.valid?
