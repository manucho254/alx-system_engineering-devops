#!/usr/bin/env ruby
# regular expression must be only matching: capital letters

SENDER=ARGV[0].scan(/\[from:(.*?)\]/).join
RECEIVER=ARGV[0].scan(/\[to:(.*?)\]/).join
FLAGS= ARGV[0].scan(/\[flags:(.*?)\]/).join

puts "#{SENDER},#{RECEIVER},#{FLAGS}"
