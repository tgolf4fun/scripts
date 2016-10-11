#import the argv module for taking user input
from sys import argv

#parameters for argv, script is build in filename to be supplied for this first run
script, filename = argv

#Open the givin file name
txt = open(filename)

#Canned text stating the file name, reading te %raw input
print "Here's your file %r:" % filename
print txt.read()

#Do it this time, but prompt for a file to enter
print "Type the filename again:"
file_again = raw_input(">")

txt_again = open(file_again)

#Enter a condition incase the file does not exist.
print txt_again.read()
