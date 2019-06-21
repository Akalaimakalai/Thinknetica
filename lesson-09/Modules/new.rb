require_relative 'validation'

class Foo
  include Validation

  attr_reader :name, :val_arr

  validate :name, :presence
  validate :name, :format, /^( |[a-z]){5,20}$/i
  validate :name, :type, String
  
  FORMAT = /^( |[a-z]){5,20}$/i

  def initialize(name)
    @name = name
    validate!
  end

  
end

foo = Foo.new("olol")

#puts foo.valid?
