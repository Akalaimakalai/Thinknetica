module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(name, validate_type, additional = '')
      @validations ||= []
      local_hash = {
        name: name,
        validate_type: validate_type,
        additional: additional
      }
      @validations << local_hash
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    private

    def validate!
      self.class.validations.each do |validation|
        mean = instance_variable_get("@#{validation[:name]}".to_sym)
        send("validate_#{validation[:validate_type]}", mean, validation[:additional])
      end
    end

    def validate_presence(name, _additional)
      raise 'Имя не может быть пустым' unless (name.strip != '') && (!name.nil?)
    end

    def validate_format(name, additional)
      raise 'Имя не соответствует заданному фармату' unless name =~ additional
    end

    def validate_type(name, additional)
      raise 'Имя не соответствует заданному типу' unless name.class == additional
    end
  end
end
