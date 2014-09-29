def fibonacci n
  p "Calculating Fibonacci number for %d" % n
  start_time = Time.now
  a = b = 1

  3.upto(n) do
    c = a + b
    a = b
    b = c
  end

  exec_time = (Time.now - start_time) * 1000.0

  p "Total executing time is %s" % exec_time

  b
end

def validate_input_arguments
  raise Exception.new "\nGive me a number\n" if ARGV.empty?
  raise Exception.new "\nArgument must be an integer\n" unless ARGV.first =~ /\d+/
end

validate_input_arguments

num = ARGV.first

p fibonacci num.to_i

