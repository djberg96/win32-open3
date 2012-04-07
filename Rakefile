require 'rake'
require 'rake/clean'
require 'rake/testtask'
require 'rbconfig'

make = RbConfig::CONFIG['MAKEFILES'].nil? ? 'nmake' : 'make'

CLEAN.include(
  "**/*.gem",
  "**/*.so",
  "**/*.o",
  "**/Makefile",
  "**/mkmf.log",
  "lib"
)

desc "Build win32-open3 (but don't install it)"
task :build => [:clean] do
  Dir.chdir('ext') do
    ruby 'extconf.rb'
    sh make
    mv 'open3.so', 'win32' # For the test suite
  end
end

desc 'Install the win32-open3 library'
task :install => [:build] do
  Dir.chdir('ext'){
    sh "#{make} install"
  }
end

desc "Run the sample program"
task :example => [:build] do |t|
  Dir.chdir('examples'){
    sh 'ruby -I../ext open3_test.rb'
  }
end

namespace 'gem' do
  desc 'Build the gem'
  task :build => [:clean] do
    spec = eval(IO.read('win32-open3.gemspec'))
    Gem::Builder.new(spec).build
  end

  desc 'Install the win32-open3 library as a gem'
  task :install => [:build] do
    file = Dir["*.gem"].first
    sh "gem install #{file}"
  end

  desc 'Build a binary gem'
  task :binary => [:clean] do
    Dir.chdir('ext') do
      ruby 'extconf.rb'
      sh make
    end

    mkdir_p 'lib/win32'
    mv 'ext/open3.so', 'lib/win32'

    spec = eval(IO.read('win32-open3.gemspec'))
    spec.extensions = nil
    spec.platform = Gem::Platform::CURRENT

    spec.files = Dir['**/*'].reject{ |file|
      file.include?('ext') || file.include?('git')
    }

    Gem::Builder.new(spec).build
  end
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

task :default => :test
