require 'pry'
require_relative 'shelter'
require_relative 'client'
require_relative 'animal'

#create instance of shelter
shelter1 = Shelter.new

#create instance of animal
animal1 = Animal. new

#setup animal
animal1.name = "Fido"
animal1.age = 2
animal1.gender = "male"
animal1.species = "Alsatian"
animal1.toys = ["tennis ball", "blanky", "stick"]

#linkages
#link animal to shelter
shelter1.animals << animal1

