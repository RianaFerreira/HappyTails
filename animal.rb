class Animal
  attr_accessor :name, :age, :gender, :species, :toys, :owner

  def initialize
    @name = "Animal Name"
    @age = 1
    @gender = "male"
    @species = "Beagle"
    @toys = []
  end

  def to_s
    "#{@name} is a #{@gender} #{@species} aged #{@age} who has the following toys: #{@toys.join(', ').to_s}"
  end

end