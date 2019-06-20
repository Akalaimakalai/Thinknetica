require_relative 'validation2'

class Foo
  include Validation

  attr_reader :name, :val_arr

  validate :name, :presence
  validate :name, :format, /^( |[a-z]){5,20}$/i
  
  FORMAT = /^( |[a-z]){5,20}$/i

  def initialize(name)
    @name = name
    validate!
  end

  
end

foo = Foo.new("ololsh")



# puts foo.class.validate(foo.name, :presence)
# puts foo.class.validate(foo.name, :format)
# puts foo.class.validate(foo.class, :type)

# #foo.validate!

# puts foo.valid?
