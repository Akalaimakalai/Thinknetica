module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(name, validate_type, additional = '')
      @data_arr ||= []
      local_arr = []
      local_arr << name
      local_arr << validate_type
      local_arr << additional
      @data_arr << local_arr
    end
  end

  module InstanceMethods
    def valid?
      true if validate!
    rescue RuntimeError
      false
    end

    private

    def validate!
      list = self.class.instance_variable_get(:@data_arr)
      a = proc { |name, _additional| true if (name.strip != '') && (!name.nil?) }
      b = proc { |name, additional| true if name =~ additional }
      c = proc { |name, additional| true if name.class == additional }
      hash = {
        presence: a,
        format: b,
        type: c
      }

      list.each do |i|
        name = i[0]
        validate_type = i[1]
        additional = i[2]
        name_mean = instance_variable_get("@#{name}".to_sym)
        x = hash[validate_type].call(name_mean, additional)
        raise "Warning!!! #{validate_type.to_s.capitalize} error!" if x.nil?
      end
    end
  end
end
