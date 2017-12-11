class IndieBookstoreFinder::State
  attr_accessor :name, :url, :cities

  @@all = []

  def initialize
    @cities = []
  end

  def self.all
    @@all
  end

end
