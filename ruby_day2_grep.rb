#!/usr/bin/env ruby

re_text = ARGV[0]
ARGV.delete_at(0)

re = Regexp.compile(/#{re_text}/i)

ARGF.each do |line|
	if re =~ line
		puts line
	end
end

