layers = File.open('input').map(&:chomp)[0].chars.each_slice(25*6).to_a

layers[0].zip(*layers[1..-1]).map{|l| l.find{|p| p != "2"}}.each_slice(25).each do |line|
  puts line.join.tr("01", " #")
end
