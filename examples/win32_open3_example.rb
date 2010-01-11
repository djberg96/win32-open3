##############################################################################
# win32_open3_example.rb
#
# Test script for the win32-open3 library. You should run this via the
# 'rake example' Rakefile task.
#
# Modify as you see fit.
##############################################################################
require 'win32/open3'

puts "VERSION: " + Open3::WIN32_OPEN3_VERSION

cmd1 = 'ver'   # valid
cmd2 = 'verb'  # invalid
cmd3 = "ruby -e 'exit 1'" # valid, with explicit exit status

# Try each command as you like...
Open3.popen3(cmd3){ |io_in, io_out, io_err|
   error = io_err.read
   if error && error.length > 0
      puts 'Error: ' + error
      break
   else
      output = io_out.read
      puts 'Output: ' + output if output
   end
}

p $?.class
p $? >> 8
p $?.stopped?
p $?.exited?
p $?.exitstatus
p $?.pid
