require 'rake'
require 'rake/clean'
require 'rake/testtask'
require 'rbconfig'
include Config

desc 'Install the win32-open3 library'
task :install => [:build] do
   Dir.chdir('ext'){
      sh 'nmake install'
   }
end

desc 'Install the win32-open3 library as a gem'
task :install_gem do
   ruby 'win32-open3.gemspec'
   file = Dir["*.gem"].first
   sh "gem install #{file}"
end

desc "Clean any build files for win32-open3"
task :clean do
   Dir.chdir('ext') do
      if File.exists?('open3.so') || File.exists?('win32/open3.so')
         sh 'nmake distclean'
         rm 'win32/open3.so' if File.exists?('win32/open3.so') 
      end
   end
end

desc "Build win32-open3 (but don't install it)"
task :build => [:clean] do
   Dir.chdir('ext') do
      ruby 'extconf.rb'
      sh 'nmake'
      mv 'open3.so', 'win32' # For the test suite
   end
end

desc "Run the sample program"
task :example => [:build] do |t|
   Dir.chdir('examples'){
      sh 'ruby -I../ext open3_test.rb'
   }
end

desc "Build a binary gem"
task :build_binary_gem => [:build] do
   mkdir_p 'lib/win32'
   mv 'ext/win32/open3.so', 'lib/win32'

   task :build_binary_gem => [:clean]

   spec = Gem::Specification.new do |gem|
      gem.name         = "win32-open3"
      gem.version      = "0.3.1"
      gem.authors      = ["Park Heesob", "Daniel Berger"]
      gem.email        = "djberg96@gmail.com"
      gem.homepage     = "http://www.rubyforge.org/projects/win32utils"
      gem.rubyforge_project = "win32utils"
      gem.platform     = Gem::Platform::CURRENT
      gem.summary      = 'Provides an Open3.popen3 implementation for MS Windows'
      gem.has_rdoc     = true
      gem.test_files   = Dir['test/test*']
      gem.license      = 'Artistic 2.0'

      files            = Dir["lib/win32/open3.so"] + Dir["test/*"]
      files.delete_if{ |f| f.include?('CVS') }
      gem.files = files

      gem.extra_rdoc_files = [
         'README',
         'CHANGES',
         'MANIFEST',
         'doc/open3.txt',
         'ext/win32/open3.c'
      ]

      gem.rubyforge_project = 'win32utils'
      gem.required_ruby_version = '>= 1.8.2'

      gem.description = <<-EOF
         The win32-open3 library provides a working implemetation of the open3
         library for MS Windows. In addition, it provides the Open4 class, which
         also returns pid information.
      
         Note that this library is largely unnecessary with Ruby 1.9.x because of
         its support for native threads.
      EOF
   end

   Gem::Builder.new(spec).build
end

Rake::TestTask.new('test') do |test|
   task :test => [:build]
   test.libs << 'ext'
   test.warning = true
   test.verbose = true
end

task :test do
   Rake.application[:clean].execute
end
