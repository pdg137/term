#!/usr/bin/env ruby

require 'rubygems'
require 'bundler'
Bundler.require(:default)

# get the original settings and save a backup
term = Termios::getattr($stdin)
original_term = term.dup

# non-canonical mode: character input
term.c_lflag &= ~Termios::ICANON
Termios.setattr($stdin, Termios::TCSANOW, term)

while c = STDIN.getc
  puts "\nRead: #{c.inspect}"
end

Termios.setattr($stdin, Termios::TCSANOW, origin_term)
