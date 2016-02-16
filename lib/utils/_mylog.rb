
def mylog(msg = '')
  printf "\x1b[38;05;14m#{msg} finished."
  printf "\x1b[38;05;10m\n"
end


# require "timeout"
#   Timeout::timeout(30) do
#     `extractbb figures/*.pdf`
#     `uplatex -kanji=UTF8 #{name}.tex`
#   end

