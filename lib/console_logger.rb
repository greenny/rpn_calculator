# Simple console loger
class ConsoleLogger
  include Singleton

  def info(msg)
    puts msg
  end

  def show_cursor
    print '> '
  end
end
