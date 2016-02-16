# encoding: utf-8

require 'yaml'
captions = YAML.load_file( File.expand_path( File.dirname(__FILE__) + '/../captions.yml' ) )

caption_words = 80

# requirements end

class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(41)
  end

  def yellow
    colorize(33)
  end
end

desc "キャプションの文章の長さが十分であるか確認する。"
task :validate do |t, args|
  captions.each do |key, value|
    macro_name = key
    caption = value

    if caption.length < caption_words
      puts "#{macro_name} is invalid. You must input #{caption_words - caption.length} words.".red
    else
      puts "#{macro_name} is valid.".yellow
    end
  end
end
