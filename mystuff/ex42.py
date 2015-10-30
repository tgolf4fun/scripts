## Animail is-a object (yes, sort of confusing) look at the extra credit
class Animal(object):
    pass

## Dog is-a object
class Dog(Animal):
    
    def __init__(self, name):
	##has-a
	self.name = name

##Cat is-a object
class Cat(Animal):   
    def __init__(self, name):
	##cat has-a name
	self.name = name

## Person is-a object
class Person(object):

    def __init__(self, name):
	##Person has-a name
	self.name = name
	
	## Person has-a pet of some kind
	self.pet = None

##Employee is-a object
class Employee(Person):

    def __init__(self, name, salary):
	##Employee has-a name
	super(Employee, self).__init__(name)
	##Employee has-a salary
	self.salary = salary

##Fish is-a object
class Fish(object):
    pass

##Salmon is-a object
class Salmon(Fish):
    pass

##Halibut is-a object
class Halibut(Fish):
    pass

## rover is-a Dog
rover = Dog("Rover")

##satan is-a cat
satan = Cat("Satan")

##Mary is-a Person
mary = Person("Mary")

##Mary has-a pet name satan
mary.pet = satan

##Frank is-a object
frank = Employee("Frank", 120000)

##Frank has-a pet
frank.pet = rover

##Flipper is-a fish
flipper = Fish()

## crouse is-a Salmon
crouse = Salmon()

##harry is-a Halibut (object)
harry = Halibut()
