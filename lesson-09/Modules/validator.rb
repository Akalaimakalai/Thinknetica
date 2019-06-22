# frozen_string_literal: true

module Validator
  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  protected

  def validate!(variable)
    raise 'Wrong format!!!' if variable !~ self.class::FORMAT
  end
end
