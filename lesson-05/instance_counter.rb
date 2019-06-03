module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
    base.send :prepend, Initializer
  end

  @@sum = 0

  module Initializer
    def Initialize
      register_instance
      super
    end 
  end

  module ClassMethods
    def instances
      puts "Созданно: #{@@sum} экземпляров."
    end
  end

  module InstanceMethods
    private
    def register_instance
      @@sum += 1
    end
  end
end
