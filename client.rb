class Client
  attr_accessor :name, :num_children, :age, :num_pets

  def initialize

    @name = "Client Name"
    @num_children = 1
    @age = 30
    @num_pets = []
  end

  def to_s
    "#{@name} profile: \n
      Is #{@age}, has #{@num_children} children and #{@num_pets} pets."
  end
end

