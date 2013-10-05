class Shelter
  attr_accessor :clients, :animals

  def initialize
    @clients = {}
    @animals = {}
  end

  def to_s
    "Clients #{@clients} Animals #{@animals}"
  end

end