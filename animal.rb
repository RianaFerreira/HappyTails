class Animal
  attr_accessor :name, :age, :gender, :species, :toys

  def initialize
    @name = "Animal Name"
    @age = 1
    @gender = "male"
    @species = "Beagle"
    @toys = []
  end

  def to_s
    "#{@name}'s profile:\n Is a #{@gender} #{@species} aged #{@age} who has the following toys: #{@toys}"
  end

end