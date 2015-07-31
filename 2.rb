a = 7
puts "Starting Thread ... "

Thread.new do
  sleep 2
  puts "Waking up"
  n = rand(1 .. 10)
  a += n
  puts "n was #{n}, a is now #{a}"
end

puts "Outside Thread"
sleep 5
puts "Outside: a is #{a}"
