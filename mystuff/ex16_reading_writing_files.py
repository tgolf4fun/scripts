#import needed module
from sys import argv

#define the arguments that will be passed in
script, filename = argv

#erasing the raw input with the %r
print "We're going to erase %r." % filename
print "If you don't want that, hit CTRL-C (^C)."
print "If you do want that, hit RETURN"

#prompt for user input
raw_input("?")

#printing a status message and opening the input file above in write mode 'w'
print "Opening the file...."
target = open(filename, 'w')

#delete the file
print "Truncating the file. Goodbye!"
target.truncate()

#fill the file with new input
print "Now I'm going to ask you for three lines."

line1 = raw_input("line 1: ")
line2 = raw_input("line 2: ")
line3 = raw_input("line 3: ")

print "I'm going to write these to the file."

#taking input from above and writing that to the "filename" first entered
target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

#Another status message, and then closing the file.
print "And finally, we close it."
target.close()
