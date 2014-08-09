def is_number_even?(n)
    n.to_s(2).end_with?('0')
end

begin
    raise Exception.new "Too less arguments" if ARGV.length == 0
    raise Exception.new "Too many arguments" if ARGV.length > 1
    raise Exception.new "Argument must be a number" if !ARGV[0].match(/\d/)

    puts is_number_even? ARGV[0].to_i
rescue Exception => e
    puts e.message
end
