module Validator
  def valid?
    validate!
    true
  rescue
    false
  end

  protected
  def validate!(variable)
    raise "Wrong format!!!" if variable !~ self.class::FORMAT
  end
end
