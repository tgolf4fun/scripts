#How many cars are there
cars = 100
#How many seats per car, motorcycles are better
space_in_a_car = 4.0
#How many people can drive
drivers = 30
#How many people are loosers,syke!!
passengers = 90
#Cars that will be lazy at a time
cars_not_driven = cars - drivers
#One person per car
cars_driven = drivers
#Yada Yada
carpool_capacity = cars_driven * space_in_a_car
#More stuff
average_passengers_per_car = passengers/cars_driven


print "There are", cars, "cars available."
print "There are only", drivers, "drivers available."
print "There will be", cars_not_driven, "empty cars today."
print "We can transport", carpool_capacity, "people today."
print "We have", passengers, "to carpool today."
print "We need to put about", average_passengers_per_car, "in each car."
