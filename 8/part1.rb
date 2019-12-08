layers = File.open('input').map(&:chomp)[0].chars.each_slice(25*6)
p layers.map{|x| [x.count(?0), x.count(?1) * x.count(?2)]}.min[1]