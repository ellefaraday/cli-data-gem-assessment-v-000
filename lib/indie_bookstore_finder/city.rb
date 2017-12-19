class IndieBookstoreFinder::City

  attr_accessor :name, :stores, :state
  @@all = []

  def initialize
    @stores = []
  end

  def self.all
    @@all
  end

end
