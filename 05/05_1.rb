#!/usr/bin/env ruby

f = File.open('input').read
jumps = f.split("\n").map {|j| j.to_i }

steps = 0
i = 0
length = jumps.length

loop do
  steps +=1
  jump = jumps[i]
  jumps[i] = jump + 1
  i += jump
  break if i < 0 || i >= length
end

p steps
