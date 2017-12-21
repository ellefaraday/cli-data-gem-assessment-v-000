class IndieBookstoreFinder::City

  attr_accessor :name, :stores, :state
  @@all = []

  def initialize(name)
    @name = name
    @stores = []
  end

  def self.all
    @@all
  end

end
