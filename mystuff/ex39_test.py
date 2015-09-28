import hashmap

#create a mapping of state to abbriviation
states = hashmap.new()
hashmap.set(states, 'Oregon', 'OR')
hashmap.set(states, 'Florida', 'FL')
hashmap.set(states, 'California', 'CA')
hashmap.set(states, 'New York', 'NY')
hashmap.set(states, 'Michgan', 'MI')

#create a basic set of states and some cites located there
cities = hashmap.new()
hashmap.set(cities, 'CA', 'San Fransico')
hashmap.set(cities, 'MI', 'Detroit')
hashmap.set(cities, 'FL', 'Jacksonville')

#add some more cities
hashmap.set(cities, 'NY', 'New York')
hashmap.set(cities, 'OR', 'Portland')

# print out some cities

print '-' * 10
print "NY State has: %s" % hashmap.get(cities, 'NY')
print "OR State has: %s" % hashmap.get(cities, 'OR')


#print out some states

print "-" * 10
print "Michigan's abbreviation is:  %s" % hashmap.get(states, 'Michigan')
print "Florida's abbreviation is: %s" % hashmap.get(states, 'Florida')

#do it by using the state then cities dict

print "-" * 10
print "Michigan has: %s" % hashmap.get(states, hashmap.get(cities, 'Michigan'))
print "Florida has: %s" % hashmap.get(states, hashmap.get(cities, 'Florida'))

#print every state abbreviation

print "-" * 10
hashmap.list(states)

#print every city in state
hashmap.list(cities)

print "-" * 10
state = hashmap.get(states, 'Texas')

if not state:
    print "Sorry no Texas (not really sorry...)."

#default values using ||= with the nil result
#can you do this on one line?
city = hashmap.get(cities, 'TX', 'Does not exist')
print "The city for the state 'TX' is: %s" % city


