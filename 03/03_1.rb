#!/usr/bin/env ruby

input = 289326

steps = 0
n = 1

def find_position_on_ring_wall_relative_to_middle(input, ring)
  ring_width = ring*2
  (ring-((input-(2*ring-1)**2)%ring_width)).abs
end

def find_steps(input, ring)
  return ring+find_position_on_ring_wall_relative_to_middle(input, ring)
end

loop do
  if (2*n+1)**2 > input
    steps = find_steps(input, n)
    break
  else
    n+=1
  end
end

p steps
