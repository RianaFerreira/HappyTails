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
    #prompt them for the client information
    puts "Enter client information"

    puts "Name"
    name = gets.chomp

    puts "Age"
    age = gets.chomp.to_i

    puts "Number of children"
    num_children = gets.chomp.to_i

    puts "Number of pets"
    num_pets = gets.chomp

    #create instance of client
    client_"#{name}" = Client.new

    #setup client
    client_"#{name}".name = name
    client_"#{name}".age = age
    client_"#{name}".num_children = num_children
    client_"#{name}".num_pets = num_pets

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

#linkages
#link animal to shelter
shelter1.animals << animal1

#link client to shelter
shelter1.clients << client1

puts shelter1.to_s


