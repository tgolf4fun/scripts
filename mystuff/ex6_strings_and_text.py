#assign x a value with a variable
x = "There are %d types of people." % 10

binary = "binary"
do_not = "don't"

#do the same with y as x above
y = "Those who know %s and those who %s." % (binary, do_not)

#print the sentences, ooooh joy
print x
print y

#%r debugging character shows "raw" data, use for debugging
print "I said: %r." %x
print "I also said: '%s'." % y

hilarious = False
joke_evaluation = "Isn't that joke so funny?! %r"

print joke_evaluation % hilarious

w = "This is the left side of ..."
e = "a string with a right side."

print w + e

