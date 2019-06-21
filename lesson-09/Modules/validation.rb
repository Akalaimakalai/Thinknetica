module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(name, validate_type, additional = '')
      @validations ||= {
        name: [],
        validate_type: [],
        additional: []
      }

      @validations[:name] << name
      @validations[:validate_type] << validate_type
      @validations[:additional] << additional
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
      define_singleton_method(:presence) do |name, _additional|
        raise 'Имя не может быть пустым' unless (name.strip != '') && (!name.nil?)
      end

      define_singleton_method(:format) do |name, additional|
        raise 'Имя не соответствует заданному фармату' unless name =~ additional
      end

      define_singleton_method(:type) do |name, additional|
        raise 'Имя не соответствует заданному типу' unless name.class == additional
      end

      limit = self.class.validations[:name].length - 1
      (0..limit).each do |i|
        name = self.class.validations[:name][i]
        mean = instance_variable_get("@#{name}".to_sym)
        validate_type = self.class.validations[:validate_type][i]
        additional = self.class.validations[:additional][i]
        send(validate_type, mean, additional)
      end
    end
  end
end
