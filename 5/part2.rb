INPUT = 5

def process(state, ptr)
  instr = state[ptr].to_s.reverse
  opcode = instr[0..1].reverse.to_i
  mode1 = instr[2].to_i || 0
  mode2 = instr[3].to_i || 0
  nxt = ptr + 4

  case opcode
  when 99
    return state
  when 1
    op1 = mode1 == 1 ? state[ptr + 1] : state[state[ptr + 1]]
    op2 = mode2 == 1 ? state[ptr + 2] : state[state[ptr + 2]]
    state[state[ptr + 3]] = op1 + op2
  when 2
    op1 = mode1 == 1 ? state[ptr + 1] : state[state[ptr + 1]]
    op2 = mode2 == 1 ? state[ptr + 2] : state[state[ptr + 2]]
    state[state[ptr + 3]] = op1 * op2
  when 3
    state[state[ptr + 1]] = INPUT
    nxt = ptr + 2
  when 4
    op1 = mode1 == 1 ? state[ptr + 1] : state[state[ptr + 1]]
    puts "OUTPUT: #{op1}"
    nxt = ptr + 2
  when 5
    op1 = mode1 == 1 ? state[ptr + 1] : state[state[ptr + 1]]
    op2 = mode2 == 1 ? state[ptr + 2] : state[state[ptr + 2]]
    nxt = op1 != 0 ? op2 : ptr + 3
  when 6
    op1 = mode1 == 1 ? state[ptr + 1] : state[state[ptr + 1]]
    op2 = mode2 == 1 ? state[ptr + 2] : state[state[ptr + 2]]
    nxt = op1 == 0 ? op2 : ptr + 3
  when 7
    op1 = mode1 == 1 ? state[ptr + 1] : state[state[ptr + 1]]
    op2 = mode2 == 1 ? state[ptr + 2] : state[state[ptr + 2]]
    state[state[ptr + 3]] = op1 < op2 ? 1 : 0
    nxt = ptr + 4
  when 8
    op1 = mode1 == 1 ? state[ptr + 1] : state[state[ptr + 1]]
    op2 = mode2 == 1 ? state[ptr + 2] : state[state[ptr + 2]]
    state[state[ptr + 3]] = op1 == op2 ? 1 : 0
    nxt = ptr + 4
  else
    puts "Operation of unknown type: #{opcode}"
    return state
  end

  process(state, nxt)
end

state = File.open('input').readline.split(/\s*,\s*/).map(&:to_i)
process(state, 0)
