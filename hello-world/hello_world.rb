class HelloWorld
 def self.hello (arg=nil)
  "Hello, " + (arg.nil? ? "World" : arg.to_s) + "!"
 end
end