def path(obj, hash, p)
  hash.has_key?(obj) ? path(hash[obj], hash, p.push(hash[obj])) : p
end

h = File.open('input').map(&:chomp).map { |line| line.split(/\s*\)\s*/) }.each_with_object(Hash.new) do |orbit, hash|
  hash[orbit[1]] = orbit[0]
end

my_path = path("YOU", h, [])
santa_path = path("SAN", h, [])
common = my_path & santa_path

puts (my_path - common).size + (santa_path - common).size