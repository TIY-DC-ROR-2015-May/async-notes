require 'unirest'

def timed &block
  start = Time.now
  block.call
  stop = Time.now
  puts "Took: #{stop - start}"
  puts
end


puts "Sync"
timed do
  5.times do
    response = Unirest.get "http://google.com"
    puts "Code: #{response.code}"
  end
end


puts "Async"
timed do
  threads = 5.times.map do
    Unirest.get "http://google.com" do |response|
      puts "Code: #{response.code}"
    end
  end
  threads.each { |thread| thread.join }
end


a,b,c = [],[],[]
t1 = Thread.new do
  a = Youtube.search
end
t2 = Thread.new do
  b = Metacritc.search
end
t3 = Thread.new do
  c = Twitch.search
end
t1.join
t2.join
t3.join
results = a + b + c
