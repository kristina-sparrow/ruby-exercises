# Using iteration, write a method #fibs which takes a number and returns an array containing that many numbers from the fibonacci sequence. Using an example input of 8, this method should return the array [0, 1, 1, 2, 3, 5, 8, 13].
def fibs(num)
  fibs = [0, 1]
  (num - 2).times do
    fibs << fibs[-1] + fibs[-2]
  end
  fibs
end

# Now write another method #fibs_rec which solves the same problem recursively. This can be done in just 3 lines (or 1 if you’re crazy, but don’t consider either of these lengths a requirement… just get it done).
def fibs_rec(num)
  return [0] if num == 1
  return [0, 1] if num == 2
  fibs_rec(num - 1) << fibs_rec(num - 1)[-1] + fibs_rec(num - 1)[-2]
end

p fibs(8)
p fibs_rec(8)