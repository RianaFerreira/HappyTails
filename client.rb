class Client
  attr_accessor :name, :num_children, :age, :num_pets, :animals

  def initialize
    @name = "Client Name"
    @num_children = 1
    @age = 30
    @num_pets = 1
    @animals = {}
  end

  def to_s
    if @animals.size > 0
       "#{@name} is #{@age}, has #{@num_children} children, #{@num_pets} pets and has adopted #{@animals.keys.join(', ').to_s}."
    else
      "#{@name} is #{@age}, has #{@num_children} children, #{@num_pets} pets and has not adpoted any pets yet."
    end
  end
end

