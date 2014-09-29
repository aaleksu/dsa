def first_unique arr
  while cur = arr[0]
    arr.shift
    if arr.index(cur).nil?
      return cur
    else
      arr.delete cur
    end
  end
end

def test
  p "expected output is 0"
  p first_unique [0, 1, 2, 3, 4]

  p "expected output is 1"
  p first_unique [0, 1, 2, 3, 4, 0]

  p "expected ouput is 2"
  p first_unique [0, 1, 2, 3, 4, 0, 1]

  p "expected output is 3"
  p first_unique [0, 1, 2, 3, 4, 0, 1, 2]

  p "expected output is 4"
  p first_unique [0, 1, 2, 3, 4, 0, 1, 2, 3]

  p "expected output is nil"
  p first_unique [0, 1, 2, 3, 4, 0, 1, 2, 3, 4]

  p "expected output is 5"
  p first_unique [0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 5]

  p "expected output is 105"
  p first_unique [11, 100, 101, 102, 103, 101, 1, 1, 102, 2, 11, 111, 103, 3333, 987654321, 1345123674545456, 1345123674545456, 1234, 104, 3, 56, 4, 7, 4, 3, 2, 56, 3333, 987654321, 100, 111, 1234, 7, 0, 0, 104, 105]
end

test