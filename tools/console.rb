require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

work = Startup.new("Workers", "Cory", "www.work.com")
hotel = Startup.new("Hotel Life", "Dan", "www.marriott.com")
cars = Startup.new("Cars 2", "Dom", "www.vroom.com")
gyms = Startup.new("Working Out", "Harry", "www.workout.com")

larry = VentureCapitalist.new("Larry", 1000000)
jayz = VentureCapitalist.new("Jay Z", 1000000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line