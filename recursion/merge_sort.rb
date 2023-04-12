# Build a method #merge_sort that takes in an array and returns a sorted array, using a recursive merge sort methodology.

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])
  merge(left, right)
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left.first < right.first
    sorted << left.shift
    else
    sorted << right.shift
    end
  end
  sorted + left + right
end

p merge_sort([1, 12, 5, 2, 8, 6])