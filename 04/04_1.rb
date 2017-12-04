#!/usr/bin/env ruby

f = File.open('input').read

counter = 0

f.each_line do |line|
  split = line.split(" ")
  if split.uniq.length == split.length
    counter += 1
  end
end

p counter
