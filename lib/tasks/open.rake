# encoding: utf-8

require 'yaml'
config = YAML.load_file( File.expand_path( File.dirname(__FILE__) + '/../config.yml' ) )["open"]

# requirements end

desc "仕上がりを確認する。"
task "open" do
  `open #{config["product"]}`
end
