class Runner
  # run calculator from file
  class FileRunner < Runner
    attr_reader :filename

    def initialize(logger, filename)
      @filename = filename
      super(logger)
    end

    def run
      quit unless File.exist?(@filename)

      input_data.each { |item| @logger.info calculator.call(item) }
    end

    private

    def input_data
      content = File.read(@filename)
      content.gsub(/\s+/m, ' ').split(' ')
    end
  end
end
