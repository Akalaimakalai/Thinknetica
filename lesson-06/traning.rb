class Train
  attr_reader :number
  NUMBER_FORMAT = /^(\d|[а-я]){3}(-)?(\d|[а-я]){2}$/i

  def initialize(number)
    @number = number
    validate!
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected
  def validate!
    raise "Wrong number format!!!" if number !~ NUMBER_FORMAT
  end
end

