def reservoir_sampling a, k
  reservoir = Array.new k
  0.upto(k) do |i|
    reservoir[i] = a[i]
  end

  (k + 1).upto(a.length - 1) do |j|
    random_n = Random.rand(1..j)
    reservoir[random_n] = a[j] if random_n <= k
  end

  reservoir
end

# p reservoir_sampling [0, 2, 11, 22, 21, 21, 3, 6, 18, 28, 4, 54, 12, 33, 72, 7, 91, 49], 5
