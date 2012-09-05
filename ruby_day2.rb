#!/usr/bin/env ruby

all = (1..16).to_a

puts "with each..."
c = []
all.each do |x|
	if c.size == 4
		puts c.join(", ")
		c = []
	end
	c << x
end
if c.size > 0
	puts c.join(", ")
end

puts
puts "with each_slice..."

all.each_slice(4) do |c|
	puts c.join(", ")
end

other_tree = {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }

def visit_method(f, t, d = 0)
	t.each do |k,v|
		f.call k, d
		visit_method f, v, d + 1
	end
end

def print_tree(k, d)
	puts "\t" * d + k
end

visit_method method(:print_tree), other_tree

class Hash
	def visit(&block)
		self.each do |k,v|
			block.call k
			v.visit &block
		end
	end
end

other_tree.visit { |k| puts k }

