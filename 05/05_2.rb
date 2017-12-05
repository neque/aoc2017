#!/usr/bin/env ruby

f = File.open('input').read
jumps = f.split("\n").map {|j| j.to_i }

steps = 0
i = 0
length = jumps.length

loop do
  steps +=1
  jump = jumps[i]
  if jumps[i] >= 3
    jumps[i] = jump - 1
  else
    jumps[i] = jump + 1
  end
  i += jump
  break if i < 0 || i >= length
end

p steps
