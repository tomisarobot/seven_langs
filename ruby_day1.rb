#!/usr/bin/env ruby

puts 'Hello, World'

hello_string = 'Hello, Ruby'
puts 'Index '+ hello_string.index('Ruby').to_s()

10.times do
	puts 'your name'
end

for i in 1..10
	puts "This is sentence number #{i}"
end

num = 1 + rand(10)
answers = ['Nope.','Awkward.','Awful.','Really?','Again.','Ennui...','Just press ctrl-c and get it over with.']

puts "Picking a number from 1 to 10 is much easier than 0 to 9."

while gets().to_i() != num
	puts answers.sample
end

puts 'Grats.'

