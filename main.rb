require 'pry'
require_relative 'shelter'
require_relative 'client'
require_relative 'animal'

  $shelter = Shelter.new

  def get_input
    print "What would you like to do?\n
          (1) Add client
          (2) Add animal
          (3) Adopt animal
          (4) Put animal up for adoption
          (5) Display all HappiTails animals
          (6) Display all HappiTails clients\n
          > "
    menu_selection = gets.chomp.to_i
    process_request(menu_selection)
  end
  def process_request(menu_selection)
    case menu_selection
    when 1
      create_client
      display_client
    when 2
      create_animal
    when 3
      adopt_animal
    when 4
      up_for_adoption
    when 5
      display_animal
    when 6
      display_client
    else
      puts "Please pick an option 1 to 6."
      get_input
    end
  end

  def create_client
      #prompt them for the client information
      puts "Enter client information"

      print "Name:\t"
      name = gets.chomp

      print "Age:\t"
      age = gets.chomp.to_i

      print "Number of children:\t"
      num_children = gets.chomp.to_i

      print "Number of pets:\t"
      num_pets = gets.chomp

      #create instance of client
      client = Client.new

      #setup client
      client.name = name
      client.age = age
      client.num_children = num_children
      client.num_pets = num_pets

      $shelter.clients << client

      puts "Client #{client.name} successfully added."
  end

  def create_animal
      #prompt them for the animal information
      puts "Enter animal information"

      print "Name:\t\t"
      name = gets.chomp

      print "Age:\t\t"
      age = gets.chomp.to_i

      print "Gender:\t\t"
      gender = gets.chomp.to_i

      print "Species:\t"
      species = gets.chomp

      #create instance of animal
      animal = Animal.new

      #setup animal
      animal.name = name
      animal.age = age
      animal.gender = gender
      animal.species = species

      print "Toys:\t\t"
      done = false
      while !done
        toy = gets.chomp
        animal.toys << toy
        print "Do you want to add another toy? (Y/N): "
        response = gets.chomp.downcase

        if response == "n"
          done = true
        end
      end
      $shelter.animals << animal
      puts "Animal #{animal.name} successfully added."
  end
  def display_animal
    #display all animals
    puts $shelter.animals
  end
  def display_client
    #display all clients
    puts $shelter.clients
  end


  def adopt_animal
    #show animals available for adoption
    #display_animal
    #prompt user to select an animal for adoption
    puts "Which animal is being adopted?"
    chosen_animal = gets.chomp
    #animal should be assigned to a client
    animal.owner = client
    #remove shelter association
    $shelter.animals.delete(chosen_animal)
  end

  def up_for_adoption
    #add new animal
    add_animal = create_animal
    #display existing clients
    puts "Setup the client for the adoption:\n
          (1) New client\n
          (2) Select existing client"
    response = gets.chomp.to_i
    case response
      when 1
        create_client
      when 2
        display_client
        puts "Enter the clients name:"
        existing_client = gets.chomp.downcase.gsub(" ","")
        #associate animal with shelter
        client.animals.delete(add_animal)
      else
        puts "Please pick option 1 or 2"
      end

  end

get_input