module Acсessors
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        define_method(name) { instance_variable_get(var_name) }

        var_arr = "@#{name}_arr"
        define_method("#{name}=".to_sym) do |value|
          if instance_variable_get(var_arr).nil?
            instance_variable_set(var_arr, [])
            instance_variable_set(var_name, value)
          elsif instance_variable_get(var_name) != value
            instance_variable_get(var_arr) << instance_variable_get(var_name)
            instance_variable_set(var_name, value)
          end
        end

        define_method("#{name}_history".to_sym) { instance_variable_get(var_arr) }
      end
    end

    def strong_attr_accessor(name, arg_class)
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }

      var_arr = "@#{name}_arr"
      define_method("#{name}=".to_sym) do |value|
        raise 'Wrong class of argement!!!' if value.class != arg_class
        if instance_variable_get(var_arr).nil?
          instance_variable_set(var_arr, [])
          instance_variable_set(var_name, value)
        elsif instance_variable_get(var_name) != value
          instance_variable_get(var_arr) << instance_variable_get(var_name)
          instance_variable_set(var_name, value)
        end
      end

      define_method("#{name}_history".to_sym) { instance_variable_get(var_arr) }
    end
  end

  module InstanceMethods
  end
end
