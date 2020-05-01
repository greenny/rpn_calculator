# Abstract class for calculator runners
class Runner
  attr_reader :calculator, :logger
  def initialize(logger)
    @calculator = RPNCalculator.new
    @logger = logger
  end

  protected

  def quit
    abort 'Exit. Goodbye!'
  end
end
