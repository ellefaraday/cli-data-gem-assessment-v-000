class IndieBookstoreFinder::City

  attr_accessor :name, :stores, :state

  def initialize
    @stores = []
  end

end
