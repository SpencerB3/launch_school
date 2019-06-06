#  Locate the ruby documentation for methods File::path and File#path. How are they different?

#  !!!Class methods are called on the class, while instance methods are called on objects!!!
#   ------------
#  CLASS METHOD
#  puts File.path('bin')  calls the CLASS METHOD File::path since we're calling it on the File class,
#  -------------
#  INSTANCE METHOD
#  f = File.new('my-file.txt')
#  puts f.path
#  calls the instance method File#path since we're calling it on an object of the File class, namely f