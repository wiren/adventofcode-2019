def process(state, ptr)
  if state[ptr] == 99
    return state
  elsif state[ptr] == 1
    state[state[ptr + 3]] = state[state[ptr + 1]] + state[state[ptr + 2]]
  elsif state[ptr] == 2
    state[state[ptr + 3]] = state[state[ptr + 1]] * state[state[ptr + 2]]
  end

  process(state, ptr + 4)
end

def init(noun, verb)
  state = File.open('input').readline.split(/\s*,\s*/).map(&:to_i)
  state[1] = noun
  state[2] = verb
  state
end

(0..99).each do |i|
  (0..99).each do |j|
    state = init(i, j)
    process(state, 0)
    if state[0] == 19690720
      puts "Result = #{i * 100 + j}"
    end
  end
end
