require 'matrix'

class ArgumentsValidator
  def self.validate
    raise Exception.new "\nGive me a number\n" if ARGV.empty?
    raise Exception.new "\nArgument must be an integer\n" unless ARGV.first =~ /\d+/
  end
end

class Fibonacci

  def initialize n
    @n = n.to_i
  end

  def run
    start_one = Time.now
    puts "\nCalculation Fibonacci number for %d with transitional values" % @n
    self.with_transitional_values

    mark_exec_time start_one

    start_two = Time.now
    puts "Calculation Fibonacci number for %d with matrices" % @n
    self.with_matrices
    mark_exec_time start_two
  end

  # more efficient if n ~< 1500
  def with_transitional_values
    a = b = 1
    3.upto(@n) do
      c = a + b
      a = b
      b = c
    end

    #puts "answer is %d" % b
  end

  # more efficient since n ~ 1500
  def with_matrices
    @m = Matrix.identity 2
    self.math_pow(@n - 1)

    #puts "answer is %d" % @m.element(0, 0)
  end

  def math_pow(n_int)
    if n_int > 1
      self.math_pow n_int/2
      @m = @m * @m
    end

    @m = @m * Matrix[[1, 1], [1, 0]] if n_int % 2 != 0
  end

  def mark_exec_time marked_time
    exec_time = (Time.now - marked_time) * 1000.0
    puts "Total executing time is %s\n\n" % exec_time
  end
end

ArgumentsValidator.validate

num = ARGV.first

fibonacci_instance = Fibonacci.new num
fibonacci_instance.run
