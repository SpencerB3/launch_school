def execute(&block)
  block #needs .call to be activated
end

 p execute { puts "Hello from inside the execute method!" }

# prints nothig to the console, returns a proc (different number and letter combination every time)

