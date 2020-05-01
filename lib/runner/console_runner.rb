class Runner
  # run calculator from console
  class ConsoleRunner < Runner
    INSTRUCTIONS = %(
      Press 'c' to clear the inputs.
      Press 'q', Ctrl+C or Ctrl+D to quit.
    ).freeze

    def run
      @logger.info INSTRUCTIONS
      loop do
        input_data.each do |item|
          quit if item.eql?('q')
          @logger.info calculator.call(item)
        end
      end
    end

    private

    def input_data
      @logger.show_cursor

      quit if ARGF.eof? # Ctrl+D

      gets.chomp.split(' ')
    rescue Interrupt # Ctrl+C
      quit
    end
  end
end
