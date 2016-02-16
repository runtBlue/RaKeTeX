# -------------------------------------
# Partial reload
# -------------------------------------

Dir["#{__dir__}/tasks/**/*.rake"].each do |path|
  load path
end
