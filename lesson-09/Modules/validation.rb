module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(name, validate_type)
      a = proc { |name| return true if (name != '') && (!name.nil?) }
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
      validate!(self.name)
      true
    rescue RuntimeError
      false
    end

    private

    def validate!(variable)
      raise 'Presence error' unless self.class.validate(variable.strip, :presence)
      raise 'Format error' unless self.class.validate(variable, :format)
      raise 'Type error' unless self.class.validate(self.class, :type)
      true
    end
  end
end
