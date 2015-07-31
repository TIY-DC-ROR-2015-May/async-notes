a = 0

thread = Thread.new do
  sleep 2
  a += 1
  puts "Thread done! Results ready!"
end

thread.join

puts "a: #{a}"
