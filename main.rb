require 'pry'
require_relative 'shelter'
require_relative 'client'
require_relative 'animal'

  $shelter = Shelter.new

  def get_input
    menu_selection = 0
    while menu_selection != 7
      print "What would you like to do?\n
            (1) Add client
            (2) Add animal
            (3) Adopt animal
            (4) Put animal up for adoption
            (5) Display all HappiTails animals
            (6) Display all HappiTails clients
            (7) Close program\n
            Your selection > "
      menu_selection = gets.chomp.to_i
      process_request(menu_selection)
    end
  end

  def process_request(menu_selection)
    case menu_selection
    when 1
      create_client
      display_client
    when 2
      create_animal
      display_animal
    when 3
      adopt_animal
      display_animal
      display_client
    when 4
      up_for_adoption
      display_animal
      display_client
    when 5
      display_animal
    when 6
      display_client
    when 7
      puts "Have a HappiTail day :)"
      return
    else
      puts "Please pick an option 1 to 7."
      get_input
    end
  end

  def create_client
      #prompt them for the client information
      puts "Enter client information"

      print "Name:\t\t\t"
      name = gets.chomp

      print "Age:\t\t\t"
      age = gets.chomp.to_i

      print "Number of children:\t"
      num_children = gets.chomp.to_i

      print "Number of pets:\t\t"
      num_pets = gets.chomp.to_i

      #create instance of client
      new_client = Client.new

      #setup client
      new_client.name = name
      new_client.age = age
      new_client.num_children = num_children
      new_client.num_pets = num_pets

      #link the new client to the shelter
      $shelter.clients[new_client.name] = new_client

      puts "Client #{new_client.name} successfully added."
      return new_client
  end

  def create_animal
      #prompt them for the animal information
      puts "Enter animal information"

      print "Name:\t\t"
      name = gets.chomp

      print "Age:\t\t"
      age = gets.chomp.to_i

      print "Gender:\t\t"
      gender = gets.chomp

      print "Species:\t"
      species = gets.chomp

      #create instance of animal
      new_animal = Animal.new

      #setup animal
      new_animal.name = name
      new_animal.age = age
      new_animal.gender = gender
      new_animal.species = species

      #assign multiple toys to the animal
      print "Toys:\t\t"
      done = false

      while !done
        toy = gets.chomp
        new_animal.toys << toy
        print "Do you want to add another toy? (Y/N): "
        response = gets.chomp.downcase

        if response == "n"
          done = true
        else
          print "Toy description >  "
        end
      end

      #link the new animal to the shelter
      $shelter.animals[new_animal.name] = new_animal
      puts "Animal #{new_animal.name} successfully added."
      return new_animal
  end
  def display_animal
    #display all animals linked to a shelter
    if $shelter.animals.size > 0
      $shelter.animals.each {|key,value| puts value}
    else
      print "HappiTails has no animals available for adoption!"
    end
  end
  def display_client
    #display all clients linked to a shelter
    $shelter.clients.each{|animal,value| puts value}
  end


  def adopt_animal
    #show animals available for adoption
    puts "Animals that can be adopted"
    display_animal
    #prompt user to select an animal for adoption
    print "Enter name of animal that is being adopted: "
    chosen_animal = gets.chomp
    #find chosen animal in the hash of animals linked to the shelter
    chosen_animal = $shelter.animals[chosen_animal]

    #show clients who can adopt a pet
    puts "Clients who are able to adopt #{chosen_animal.name}"
    display_client
    #prompt user to select a client who is adopting a pet
    print "Enter name of client or 'Add' to create a new client for the adoption: "
    chosen_client = gets.chomp.downcase
    #if the client doesn't exist, redirect user to the create_client method and return the new client object
    if chosen_client == "add"
      chosen_client = create_client
    else
      #find chosen client in the hash of clients linked to the shelter
      chosen_client = $shelter.clients[chosen_client]
    end
    #animal should have a link to a client
    chosen_animal.owner = chosen_client.name
    #animal should be assigned to a client
    chosen_client.animals[chosen_animal.name] = chosen_animal
    #remove shelter association
    $shelter.animals.delete(chosen_animal.name)
    binding.pry
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