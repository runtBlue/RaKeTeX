# encoding:utf-8

desc ".md から .tex を生成する。"
task :pandoc => ["md_to_tex", "move_tex"]