# encoding: utf-8

require 'yaml'
config = YAML.load_file( File.expand_path( File.dirname(__FILE__) + '/../config.yml' ) )["pandoc"]

# requirements end

task "pandoc:tex" do
  Dir.glob(config["src"]).map do |md|
    tex = md.sub(".md", ".tex")
    `pandoc #{md} -w latex -o #{tex}`
  end
end
