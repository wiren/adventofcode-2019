MOVES = { "R" => [1, 0], "U" => [0, 1], "L" => [-1, 0], "D" => [0, -1] }

def steps(instrs)
  instrs.map { |instr| Array.new(instr[1..-1].to_i, MOVES[instr[0]]) }.flat_map(&:itself)
      .reduce([[0, 0]]) { |res, step| res.push([res.last[0] + step[0], res.last[1] + step[1]]) }
end

paths = File.readlines('input').map(&:chomp).map { |s| s.split(/\s*,\s*/) }.map { |instrs| steps(instrs) }
intersects = (paths[0] & paths[1]).select { |pt| pt != [0, 0] }
puts intersects.map { |pt| paths[0].index(pt) + paths[1].index(pt) }.min