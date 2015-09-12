#define a function called cheese_and_crackers
def cheese_and_crackers(cheese_count, boxes_of_crackers):
    print "You have %d cheeses!" % cheese_count
    print 'You have %d boxes of crackers!' % boxes_of_crackers
    print "Man that's enough for a party!"
    print "Get a blanket.\n"

#assign values to cheese_count and boxes_of_crackers
print "We can just give the function numbers directly:"
cheese_and_crackers(20,30)

#the print lines says what this is doing
print "Or, we can use variables from our script:"
amount_of_cheese=10
amount_of_crackers=50

#so this is how the 10 and 50 get in there.
cheese_and_crackers(amount_of_cheese, amount_of_crackers)

print "We can even do math inside too:"
cheese_and_crackers(10 + 20, 5 + 6)

#print statements are great comments
print "And we can combine the two, variables and math:"
cheese_and_crackers(amount_of_cheese + 100, amount_of_crackers + 1000)
