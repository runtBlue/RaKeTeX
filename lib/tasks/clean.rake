# encoding: utf-8

require 'yaml'
config = YAML.load_file( File.expand_path( File.dirname(__FILE__) + '/../config.yml' ) )["clean"]

# requirements end
desc "プロジェクトのルートディレクトリから目障りなファイルを削除"
task "clean" do
  config["src"].map do |prefix|
    `rm *.#{prefix}`
  end
end
