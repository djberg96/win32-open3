require 'rubygems'

spec = Gem::Specification.new do |gem|
   gem.name       = 'win32-open3'
   gem.version    = '0.3.2'
   gem.authors    = ['Park Heesob', 'Daniel J. Berger']
   gem.email      = 'djberg96@gmail.com'
   gem.homepage   = 'http://www.rubyforge.org/projects/win32utils'
   gem.platform   = Gem::Platform::RUBY
   gem.summary    = 'Provides an Open3.popen3 implementation for MS Windows'
   gem.test_file  = 'test/test_win32_open3.rb'
   gem.has_rdoc   = true
   gem.license    = 'Artistic 2.0'  
   gem.extensions = ['ext/extconf.rb']
   gem.files      = Dir['**/*'].reject{ |f| f.include?('CVS') }
   
   gem.extra_rdoc_files = [
      'CHANGES',
      'README',
      'MANIFEST',
      'doc/open3.txt',
      'ext/win32/open3.c'
   ]
   
   gem.rubyforge_project = 'win32utils'
   gem.required_ruby_version = '>= 1.8.2'
   
   gem.description = <<-EOF
      The win32-open3 library provides a working implementation of the open3
      library for MS Windows. In addition, it provides the Open4 class, which
      also returns pid information.
      
      Note that this library is largely unnecessary with Ruby 1.9.x because of
      its support for native threads.
   EOF
end

Gem::Builder.new(spec).build
