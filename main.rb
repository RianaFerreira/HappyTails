require 'pry'
require_relative 'shelter'
require_relative 'client'
require_relative 'animal'

def get_input
  puts "What would you like to do?\n
                        (1) Add client
                        (2) Add animal
                        (3) Adopt animal
                        (4) Put animal up for adoption
                        (5) Display all HappiTails animals
                        (6) Display all HappiTails clients"
  menu_selection = gets.chomp
  process_request(menu_selection)
end
def process_request(menu_selection)
  case menu_selection
  when 1

  when 2

  when 3

  when 4

  when 5

  when 6

  else
    puts "Please pick an option 1 to 6."
    get_input
  end
end

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

#create instance of client
client1 = Client.new

#setup client
client1.name = "Mr Rogers"
client1.num_children = 2
client1.age = 40
client1.num_pets = 1

#linkages
#link animal to shelter
shelter1.animals << animal1

#link client to shelter
shelter1.clients << client1

puts shelter1.to_s


