pr = proc {|x, y| x }
p [[1, 2], [3, 4]].map(&pr) #=> [1, 3]