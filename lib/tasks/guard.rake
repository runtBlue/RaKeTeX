# encoding:utf-8

desc "$ guard がデフォルトで実行するコマンド"
task :guard => ["default", "tex_to_pdf"] # TOCを配慮して２回実行する