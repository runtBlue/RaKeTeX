# encoding: utf-8

require 'yaml'

config = YAML.load_file( File.expand_path( File.dirname(__FILE__) + '/../config.yml' ) )["embody"]

# requirements end

desc "図・画像を .pdf に変換し、それぞれに .xbb ファイルを与える。"
task :embody => ["delete_figures", "embody_others", "embody_pdf"]


task :delete_figures do
  files = config["delete"]
  Dir.glob(files).each do |file|
    `rm #{file}`
  end
end

task :embody_others do
  Dir.glob(config["src"]).each do |raw|

    pdf = config["dest"] + File.basename(raw, File.extname(raw)).to_s + ".pdf"
    `convert -density 144 #{raw} #{pdf}`
    puts pdf
  end
  `extractbb #{config["dest"]}*.pdf`
end

task :embody_pdf do
  Dir.glob(config["copy_src"]).each do |pdf|
    dest = config["dest"]
    `cp #{pdf} #{dest}`
  end
  `extractbb #{config["dest"]}*.pdf`
end