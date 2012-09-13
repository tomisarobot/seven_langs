#!/usr/bin/env ruby

require 'forwardable'

module ActsAsTabFile
	def self.included(base)
		base.extend ClassMethods
	end
	module ClassMethods
		def acts_as_tab
			include InstanceMethods
		end
	end
	module InstanceMethods
		include Enumerable
# 		extend Forwardable
# 		def_delegators :@tab_contents, :each, :<<
		def read
			@tab_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split("\t")
			file.each do |row|
				@tab_contents << row.chomp.split("\t")
			end
			@tab_contents.each do |tc|
				def tc.head=(h)
					@headers = h
				end
				tc.head = @headers
				def tc.method_missing name, *args
					if idx = @headers.index(name.to_s())
						return self[idx]
					end
					return super
				end
			end
		end
		attr_accessor :headers, :tab_contents
		def initialize
			read
		end
		def each(&block)
			@tab_contents.each(&block)
		end
	end
end

class HappyTabFile # no inheritance! You can mix it in
	include ActsAsTabFile
	acts_as_tab
end

m = HappyTabFile.new
# puts m.headers.inspect
# puts m.tab_contents.inspect

m.each do |outer|
	puts 'each on outer: '+ outer.to_s()
	outer.each do |inner|
		puts "  inner: "+ inner
	end
	puts "anim="+ outer.animal
	puts "conj="+ outer.conjecture
end

