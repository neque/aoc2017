#!/usr/bin/env ruby

input = 289326

$offset = 5
n = 2 # We have 1 seeded to first cell so start from second one

$matrix = Array.new(2*$offset+1).map { |a| Array.new(2*$offset+1,0) }

$matrix[$offset][$offset] = 1

def get_ring(n)
  ring = 1
  loop do
    return ring if (2*ring-1)**2 >= n
    ring+=1
  end
end

def calculate_coordinates(n, ring)
  prev_ring_max = (2*(ring-1)-1)**2
  current_ring_max  = (2*ring-1)**2
  modulo = (current_ring_max - prev_ring_max)/4
  tmp = n - prev_ring_max

  x, y = 0, 0

  case tmp/modulo
  when 0
    x = ring-1
    y = 0 + tmp%modulo - modulo/2
  when 1
    y = ring-1
    x = 0 - tmp%modulo + modulo/2
  when 2
    x = 1 - ring
    y = 0 - tmp%modulo + modulo/2
  when 3
    y = 1 - ring
    x = 0 + tmp%modulo - modulo/2
  when 4
    y = 1 - ring
    x = 0 + modulo/2
  end

  return [x+$offset,y+$offset]
end

def calculate_value(n, x, y)
  value = 0
  [-1,0,1].each do |dx|
    [-1,0,1].each do |dy|
      value += $matrix[x+dx][y+dy]
    end
  end
  value
end

def save_value(value, x, y)
end

loop do
  ring = get_ring(n)
  x, y = calculate_coordinates(n, ring)
  value = calculate_value(n, x, y)
  $matrix[x][y] = value
  #p "(#{x-$offset},#{y-$offset}) #{value}"
  if value > input
    p value
    break
  end
  n+=1
end
