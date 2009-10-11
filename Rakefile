require 'rubygems'  
require 'rake'  
require 'echoe'  
  
Echoe.new('remoteling-ruby', '0.0.5') do |p|  
  p.description     = "Ruby gem for working with Remoteling (http://remoteling.com)"
  p.url             = "http://github.com/adrianpike/remoteling-ruby"  
  p.author          = "Adrian Pike"  
  p.email           = "adrian@pikeapps.com"  
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies = []  
end  

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }