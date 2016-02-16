# encoding: utf-8

require 'yaml'
config = YAML.load_file( File.expand_path( File.dirname(__FILE__) + '/../config.yml' ) )["onweb"]

# requirements end

url = config["url"]

desc "リモートリポジトリを確認する。"
task "onweb" do
  `open \"#{url}\"`
end
