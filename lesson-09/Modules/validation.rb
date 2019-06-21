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
      self.class.validations.each { |i| print "#{i}\n"}

      define_singleton_method(:presence) do |name, _additional|
        raise 'Имя не может быть пустым' unless (name.strip != '') && (!name.nil?)
      end

      define_singleton_method(:format) do |name, additional|
        raise 'Имя не соответствует заданному фармату' unless name =~ additional
      end

      define_singleton_method(:type) do |name, additional|
        raise 'Имя не соответствует заданному типу' unless name.class == additional
      end

      self.class.validations.each do |i|
        mean = instance_variable_get("@#{i[:name]}".to_sym)
        send(i[:validate_type], mean, i[:additional])
      end
    end
  end
end
