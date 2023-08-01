#!/usr/bin/env ruby

if ARGV[0].length < 10 or ARGV[0].length > 10
  puts "\n"
else
  puts ARGV[0].scan(/^\d[0-9]+$/).join
end
