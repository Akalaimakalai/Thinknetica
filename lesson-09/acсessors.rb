module Acсessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }

      var_arr = "@#{name}_arr"
      var_histiry_name = "#{name}_array".to_sym
      define_method(var_histiry_name) { instance_variable_set(var_arr, []) }

      define_method("#{name}=".to_sym) do |value| 
        #send(var_histiry_name) if send(name).nil?
        instance_variable_set(var_name, value)
        instance_variable_get(var_arr) << value
      end 
      
      method_added("#{name}=") { send(var_histiry_name) }
    end
  end
end
