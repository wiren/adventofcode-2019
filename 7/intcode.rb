class Intcode
  def initialize(code, phase)
    @code = code
    @input = [phase]
    @ptr = 0
  end

  def add_input(new_input)
    @input.push(new_input)
  end

  def process()
    instr = @code[@ptr].to_s.reverse
    opcode = instr[0..1].reverse.to_i
    mode1 = instr[2].to_i || 0
    mode2 = instr[3].to_i || 0

    case opcode
    when 99
      return nil
    when 1
      op1 = mode1 == 1 ? @code[@ptr + 1] : @code[@code[@ptr + 1]]
      op2 = mode2 == 1 ? @code[@ptr + 2] : @code[@code[@ptr + 2]]
      @code[@code[@ptr + 3]] = op1 + op2
      @ptr += 4
    when 2
      op1 = mode1 == 1 ? @code[@ptr + 1] : @code[@code[@ptr + 1]]
      op2 = mode2 == 1 ? @code[@ptr + 2] : @code[@code[@ptr + 2]]
      @code[@code[@ptr + 3]] = op1 * op2
      @ptr += 4
    when 3
      @code[@code[@ptr + 1]] = @input.shift
      @ptr += 2
    when 4
      op1 = mode1 == 1 ? @code[@ptr + 1] : @code[@code[@ptr + 1]]
      @ptr += 2
      return op1
    when 5
      op1 = mode1 == 1 ? @code[@ptr + 1] : @code[@code[@ptr + 1]]
      op2 = mode2 == 1 ? @code[@ptr + 2] : @code[@code[@ptr + 2]]
      @ptr = op1 != 0 ? op2 : @ptr + 3
    when 6
      op1 = mode1 == 1 ? @code[@ptr + 1] : @code[@code[@ptr + 1]]
      op2 = mode2 == 1 ? @code[@ptr + 2] : @code[@code[@ptr + 2]]
      @ptr = op1 == 0 ? op2 : @ptr + 3
    when 7
      op1 = mode1 == 1 ? @code[@ptr + 1] : @code[@code[@ptr + 1]]
      op2 = mode2 == 1 ? @code[@ptr + 2] : @code[@code[@ptr + 2]]
      @code[@code[@ptr + 3]] = op1 < op2 ? 1 : 0
      @ptr += 4
    when 8
      op1 = mode1 == 1 ? @code[@ptr + 1] : @code[@code[@ptr + 1]]
      op2 = mode2 == 1 ? @code[@ptr + 2] : @code[@code[@ptr + 2]]
      @code[@code[@ptr + 3]] = op1 == op2 ? 1 : 0
      @ptr += 4
    else
      puts "Operation of unknown type: #{opcode}"
      @ptr = -1
      return nil
    end

    process
  end
end