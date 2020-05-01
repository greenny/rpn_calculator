require 'bigdecimal'
require 'bigdecimal/util'

# RPNCalculator engine
class RPNCalculator
  attr_reader :numbers

  OPERATOR_ALIASES = {
    '+' => '+',
    '-' => '-',
    '/' => '/',
    '*' => '*'
  }.freeze
  ERRORS = {
    missing_arg: 'At least two number required',
    zero_division: 'Dividing by zero not alowed'
  }.freeze

  def initialize
    @numbers = []
  end

  def call(input_string)
    if OPERATOR_ALIASES.keys.include?(input_string)
      calculate(input_string)
    else
      add_number(input_string)
    end
  end

  private

  def add_number(input_string)
    @numbers << input_string.to_d
    formatted_number(input_string)
  end

  def calculate(operator)
    return ERRORS[:missing_arg] if @numbers.length < 2
    return ERRORS[:zero_division] if operator == '/' && @numbers.last.zero?

    result = @numbers[-2].send OPERATOR_ALIASES[operator], @numbers[-1]
    @numbers = @numbers[0..-3]
    @numbers << result
    result.to_f
  end

  def formatted_number(input_string)
    if input_string.match?(/\D/)
      # Display string as Float
      input_string.to_f
    else
      # Display original string
      input_string
    end
  end
end
