# Seeing the MRI Garbage Collection in Action.

def display_count
  # ObjectSpace - information on GC allocaiton space and current object.s
  data = ObjectSpace.count_objects
  puts "Total: #{data[:TOTAL]} Free: #{data[:FREE]} Object: #{data[:T_OBJECT]}"
end

100.times do
  obj = Object.new
  display_count
end

# Full garbage collection!
GC.start
display_count