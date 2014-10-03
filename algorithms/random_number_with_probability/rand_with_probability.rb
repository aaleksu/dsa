def rand_with_probability
  rand_num = rand(1...100)

  case rand_num
  when 0..5
    return 1
  when 6..15
    return 2
  when 16..25
    return 3
  when 26..40
    return 4
  when 41..60
    return 5
  when 61..100
    return 6
  end
end

counts = Array.new 7, 0

(1..100).each do |i|
  rand_num = rand_with_probability
  counts[rand_num] += 1
end

counts.each_with_index do |v, i|
  next if i == 0
  puts "Values of %d: %d" % [i, v]
end

