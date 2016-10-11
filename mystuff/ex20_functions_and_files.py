#import argv from the sys module
from sys import argv

#typical assign input to argv
script, input_file = argv

#print the output from the input_file, useing the "f" as a "position marker"
def print_all(v):
    print v.read()

#start at the top of the file again.
def rewind(v):
    v.seek(0)

#print line count of "f" the position marker
def print_a_line(line_count, v):
    print line_count, v.readline()

current_file = open(input_file)

print_all(current_file)


print "Now let's rewind, kind of like a tape."

rewind(current_file)

current_line = 1

print "Let's print three lines:"

current_line = 1
print_a_line(current_line, current_file)

current_line = current_line + 1
print_a_line(current_line, current_file)

current_line = current_line + 1
print_a_line(current_line, current_file)
