class IndieBookstoreFinder::City

  attr_accessor :name, :stores, :state
  @@all = []

  def initialize(name, state)
    @name = name
    @stores = []
    state.cities << self
  end

  def self.all
    @@all
  end

end
