a = 7
puts "Starting fork ... "

fork do
  sleep 2
  puts "Waking up"
  n = rand(1 .. 10)
  a += n
  puts "n was #{n}, a is now #{a}"
end

puts "Outside fork"
sleep 5
puts "Outside: a is #{a}"
