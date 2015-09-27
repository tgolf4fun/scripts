#import the exit fuction??
from sys import exit

#ahh yes the gold room function
def gold_room():
    print "This room is full of gold. How much do you take?"

#prompt for my entry
    choice = raw_input('# ')
    if  "0" in choice or "1" in choice:
	#turns my string into and integer
        how_much = int(choice)
    else:
        dead("Man, learn to type an number.")

    if how_much < 50:
        print ("Nice, your're not greedy, you win!")
	#quit the game
        exit(0)
    else:
        dead("You greedy bastard")


def bear_room():
    print "There is a bear here."
    print "The bear has a bunch of honey."
    print "The fat bear is in front of another door."
    print "How are you going to move the bear?"
    bear_moved = False
    print "\n"
    print "choices are \"take honey\" or \"taunt bear\"."
    while True:
        choice  = raw_input('# ')
        
        if choice == "take honey":
            dead("The bear looks at you then slaps your face off")
	elif choice == "taunt bear" and not bear_moved:
	    print ("The bear has moved from the door. You can go through it now")

	    bear_moved = True
	elif choice == "taunt" and bear_moved:
            dead("The bear gets pissed off and chews your leg off.")
	elif choice == "open door" and bear_moved:
            gold_room()
	else:
	    print "I got no idea what that means."



def cthulhu_room():
    print "Here you see the great evil Cthulhu."
    print "He, it, whatever stares at you and you go insane."
    print "Do you flee for your life our eat your head."

    choice = raw_input('# ')
    
    if "flee" in choice:
	start()
    elif "head" in choice:
	print ("Well that was tasty!")
    else:
        cthuluh_room()

def dead(why):
    print why
    print "Good Job!"
    exit(0)

def start():
    print "You are in a dark room."
    print "There is a door to your right and left."
    print "Which one do you take?"

    choice = raw_input('# ')

    if choice == "left":
	bear_room()
    elif choice == "right":
	cthulhu_room()
    else:
        deat("You stumbled around the room until you starve.")

start()
