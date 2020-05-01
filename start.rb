require 'singleton'
require './lib/rpn_calculator'
require './lib/console_logger'
require './lib/runner'
require './lib/runner/console_runner'
require './lib/runner/file_runner'

logger = ConsoleLogger.instance
logger.info 'Welcome to the RPN Calculator! In Reverse Polish Notation (RPN)'

if ARGV.any?
  Runner::FileRunner.new(logger, ARGV.first).run
else
  Runner::ConsoleRunner.new(logger).run
end
