require File.expand_path(File.dirname(__FILE__))+'/lib/documentor'

namespace :documentor do
  
  task :test do |t, test|
  	
  end 
  
  task :generate, :input, :output  do |t, args|
    raise 'Input file not specified'  if args[:input].nil?
    raise 'Output file not specified' if args[:output].nil?

    result = Documentor.new(File.open(args[:input]){|file| file.read}).generate
    File.open(args[:output], 'w'){|file| file.puts result}
  end

end
  