module InstanceCounter 
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods        
    def instances
      @instances
    end

    protected
    def count 
      @instances += 1
    end
  end

  module InstanceMethods
    protected
    def register_instance
      @instances ||= 0
      @instances += 1
    end
  end
end
