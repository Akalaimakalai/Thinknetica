module InstanceCounter 
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
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
      self.class.send :count
    end
  end
end
