puts File.open('input').map {|line| line.to_i / 3 - 2}.reduce(&:+)
