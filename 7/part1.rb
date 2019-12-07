require './intcode'

def get_code
  File.open('input').readline.split(/\s*,\s*/).map(&:to_i)
end

def run_phase(phase_seq)
  next_input = 0

  phase_seq.each do |phase|
    i = Intcode.new(get_code, phase)
    i.add_input(next_input)
    next_input = i.process
  end

  next_input
end

puts (0..4).to_a.permutation.map { |phase_seq| run_phase(phase_seq) }.max