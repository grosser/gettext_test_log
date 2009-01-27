require 'rubygems'
require 'echoe'

desc "Run all specs in spec directory"
task :test do |t|
  options = "--colour --format progress --loadby --reverse"
  files = FileList['spec/**/*_spec.rb']
  system("spec #{options} #{files}")
end

#Gemspec
porject_name = 'gettext_test_log'
Echoe.new(porject_name , '0.1') do |p|
  p.description    = "Logs all gettext translations during test execution, to a updatepo readable format"
  p.url            = "http://github.com/grosser/#{porject_name}"
  p.author         = "Michael Grosser"
  p.email          = "grosser.michael@gmail.com"
  p.dependencies   = %w[]
end

task :update_gemspec => [:manifest, :build_gemspec]