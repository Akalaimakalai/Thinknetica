# frozen_string_literal: true

module Company
  attr_reader :company_name

  def add_company(name)
    @company_name = name
  end
end
