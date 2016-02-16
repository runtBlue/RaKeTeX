# encoding: utf-8

require 'yaml'
config = YAML.load_file( File.expand_path( File.dirname(__FILE__) + '/../config.yml' ) )["catalog"]
captions = YAML.load_file( File.expand_path( File.dirname(__FILE__) + '/../captions.yml' ) )

# requirements end


desc "マクロを更新。"
task :catalog do |t, args|

  macros = []

  Dir.glob(config["src"]).map do |pdf|

    basename = File.basename(pdf, ".pdf")
    submacro = basename.gsub(/([- 0-9])/, "")
    macro = basename.split("@")[1] || submacro

    optional_macros = {
      "#{macro}"=> {
        "size"=> "10.0cm",
        "insert_option"=> false,
      },
      "#{macro}H"=> {
        "size"=> "10.0cm",
        "insert_option"=> "H",
      },
      "#{macro}Xfifteen"=> {
        "size"=>   "16.0cm",
        "insert_option"=> false,
      },
      "#{macro}XfifteenH"=> {
        "size"=>   "16.0cm",
        "insert_option"=> "H",
      },
      "#{macro}Xfourteen"=> {
        "size"=>   "14.0cm",
        "insert_option"=> false,
      },
      "#{macro}XfourteenH"=> {
        "size"=>   "14.0cm",
        "insert_option"=> "H",
      },
      "#{macro}Xtwelve"=> {
        "size"=>   "12.0cm",
        "insert_option"=> false,
      },
      "#{macro}XtwelveH"=> {
        "size"=>   "12.0cm",
        "insert_option"=> "H",
      },
      "#{macro}Xeight"=> {
        "size"=>   "8.0cm",
        "insert_option"=> false,
      },
      "#{macro}XeightH"=> {
        "size"=>   "8.0cm",
        "insert_option"=> "H",
      },
      "#{macro}Xseven"=> {
        "size"=>   "7.0cm",
        "insert_option"=> false,
      },
      "#{macro}XsevenH"=> {
        "size"=>   "7.0cm",
        "insert_option"=> "H",
      },
      "#{macro}Xsix"=> {
        "size"=>   "6.0cm",
        "insert_option"=> false,
      },
      "#{macro}XsixH"=> {
        "size"=>   "6.0cm",
        "insert_option"=> "H",
      },
    }

    optional_macros.each do |key, value|

      macro_name = key
      options = value
      macro_width = options["size"]
      insert_option = if options["insert_option"] then options["insert_option"] else "htbp" end;

      puts "\\#{macro_name}"
      caption = captions[macro] || macro_name

      template = """
        \\begin{figure}[#{insert_option}]
        \\centering
        \\includegraphics[width = #{macro_width}]{#{File.expand_path(pdf)}}
        \\caption{#{caption}}
        \\end{figure}
      """.gsub(" ", "").chomp

      macros.push ""
      macros.push "\\def"
      macros.push "\\#{macro_name}"
      macros.push "{"
      macros.push template
      macros.push "}\n\n"

    end


  end

  File.write config["macro"], macros.join("")

end
