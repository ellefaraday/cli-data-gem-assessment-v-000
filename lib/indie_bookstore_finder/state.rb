class IndieBookstoreFinder::State
  attr_accessor :name, :url, :cities

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @cities = []
    @@all << self
  end

  def self.all
    @@all
  end

end
