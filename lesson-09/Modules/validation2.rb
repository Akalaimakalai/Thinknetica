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
      print "#{@data_arr}\n"
    end
  end

  module InstanceMethods
    def valid?
    end

    private
    def validate!
      list = self.class.instance_variable_get(:@data_arr)
      print "#{list}\n"
      a = proc { |name, additional| true if (name.strip != '') && (!name.nil?) }
      b = proc { |name, additional| true if name =~ additional }
      c = proc { |name, additional| true if name == additional }
      hash = {
        presence: a,
        format: b,
        type: c
      }

      
      list.each do |i|
        print "Work with: #{i}\n"
        name = i[0]
        validate_type = i[1]
        additional = [2]
        name_mean = self.instance_variable_get("@#{name.to_s}".to_sym)
        puts name_mean

        x = hash[validate_type].call(name_mean, additional)
        raise "#{validate_type.to_s} error!" if x.nil?

        puts "worked"        
      end
    end
  end
end
