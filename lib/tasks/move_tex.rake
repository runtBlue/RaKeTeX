# encoding: utf-8

require 'yaml'
config = YAML.load_file( File.expand_path( File.dirname(__FILE__) + '/../config.yml' ) )["moveTex"]

# requirements end

task "move:tex" do
  `mv #{config["src"]} #{config["dest"]}`
end
