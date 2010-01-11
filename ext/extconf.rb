require 'mkmf'

have_header('ruby/io.h')
have_type('rb_pid_t', 'ruby.h') # For 1.8.3 and later
create_makefile('win32/open3', 'win32')
