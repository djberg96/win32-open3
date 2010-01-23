require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'win32-open3'
  spec.version    = '0.3.2'
  spec.authors    = ['Park Heesob', 'Daniel J. Berger']
  spec.email      = 'djberg96@gmail.com'
  spec.homepage   = 'http://www.rubyforge.org/projects/win32utils'
  spec.platform   = Gem::Platform::RUBY
  spec.summary    = 'Provides an Open3.popen3 implementation for MS Windows'
  spec.test_file  = 'test/test_win32_open3.rb'
  spec.has_rdoc   = true
  spec.license    = 'Artistic 2.0'  
  spec.extensions = ['ext/extconf.rb']
  spec.files      = Dir['**/*'].reject{ |f| f.include?('git') }
   
  spec.extra_rdoc_files = [
    'CHANGES',
    'README',
    'MANIFEST',
    'doc/open3.txt',
    'ext/win32/open3.c'
  ]
   
  spec.rubyforge_project = 'win32utils'
  spec.required_ruby_version = '< 1.9.0'
   
  spec.description = <<-EOF
    The win32-open3 library provides a working implementation of the open3
    library for MS Windows. In addition, it provides the Open4 class, which
    also returns pid information.
      
    Note that this library is unnecessary with Ruby 1.9.x because of its
    support for native threads.
  EOF
end
