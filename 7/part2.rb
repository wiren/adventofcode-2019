require './intcode'

def get_code
  File.open('input').readline.split(/\s*,\s*/).map(&:to_i)
end

def run_phase(phase_seq)
  amps = phase_seq.map { |phase| Intcode.new(get_code, phase) }

  curr_amp = 0
  curr_out = 0
  while true
    amps[curr_amp].add_input(curr_out)
    res = amps[curr_amp].process
    break if res.nil?
    curr_out = res
    curr_amp = (curr_amp + 1) % 5
  end

  curr_out
end

puts (5..9).to_a.permutation.map { |phase_seq| run_phase(phase_seq) }.max
