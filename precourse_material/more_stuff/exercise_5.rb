def execute(&block)  # was not working before due to a missing ampersand befor the parameter name
  block.call
end

execute { puts "Hello from inside the execute method!" }