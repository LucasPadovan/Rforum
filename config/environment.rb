# Load the rails application
require File.expand_path('../application', __FILE__)

Dir[File.dirname(__FILE__) + "/../lib/*"].each do |path|
  gem_name = File.basename(path.gsub(/-\d+.\d+.\d+$/, ''))
  gem_path = path + "/lib/" + gem_name + ".rb"
  require gem_path if File.exists? gem_path
end

# Initialize the rails application
Animanga::Application.initialize!
