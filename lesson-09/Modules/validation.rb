module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(name, validate_type)
      a = proc { |name| return true if (name.strip != '') && (!name.nil?) }
      b = proc { |name| return true if name =~ self::FORMAT }
      c = proc { |name| return true if name == self }
      hash = {
        presence: a,
        format: b,
        type: c
      }

      hash[validate_type].call(name)
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    private

    def validate!(variable)
      raise 'Presence error' unless self.class.validate(variable, :presence)
      raise 'Format error' unless self.class.validate(variable, :format)
      raise 'Type error' unless self.class.validate(self.class, :type)
      true
    end
  end
end

# module Validation
#   def self.validate(name, validate_type, *additional)
#     hash = {
#       presence: "presence?",
#       format: "format?",
#       type: "type?"
#     }
#     send(hash[validate_type])(name, additional.first)
#   end

#   def valid? (name, my_format, my_class)
#     return true if validate!(name, my_format, my_class)
#     false
#   end

#   private

#   def validate! (name, my_format, my_class)
#     raise "Presence error" unless self.class.validate(name, :presence)
#     raise "Format error" unless self.class.validate(name, :format, my_format)
#     raise "Type error" unless self.class.validate(name, :type, my_class)
#     true
#   end

#   def presence?(*name)
#     return true if (name.first.strip != '') && (name.first != nil)
#     false
#   end

#   def format?(name, my_format)
#     return true if name ~= my_format
#     false
#   end

#   def type?(name, my_class)
#     return true if name.class == my_class
#     false
#   end
# end
