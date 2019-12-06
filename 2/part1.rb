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

state = File.open('input').readline.split(/\s*,\s*/).map(&:to_i)
state[1] = 12
state[2] = 2
puts process(state, 0)