def timed &block
  start = Time.now
  block.call
  stop = Time.now
  puts "Took: #{stop - start}"
  puts
end

def nap
  if rand(1..10) == 1
    sleep 0.01
  end
end

timed do
  a = 0
  100.times do
    tmp = a
    nap
    a = tmp + 1
  end

  puts "a: #{a}"
end


timed do
  b = 0
  100.times do
    Thread.new do
      tmp = b
      nap
      b = tmp + 1
    end
  end

  puts "b: #{b}"
end

timed do
  c = 0
  threads = 100.times.map do
    Thread.new do
      tmp = c
      nap
      c = tmp + 1
    end
  end
  threads.each { |thread| thread.join }

  puts "c: #{c}"
end
