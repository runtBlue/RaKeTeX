# encoding: utf-8

require "timeout"
require 'yaml'
require "open3"
config = YAML.load_file( File.expand_path( File.dirname(__FILE__) + '/../config.yml' ) )["compileTex"]

# requirements end

desc "tex から pdf を生成する。"
task "tex-to-pdf" do
  Timeout::timeout(45) do
    out, err, status = Open3.capture3 "uplatex -kanji=UTF8 #{config["src"]}"
    print out
    print err
    print status
  end
  `dvipdfmx #{config["preproduct"]}`
  `mv #{config["product"]} #{config["dest"]}`
end
