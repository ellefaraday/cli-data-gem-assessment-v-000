class IndieBookstoreFinder::Store
<<<<<<< HEAD
  attr_accessor :name, :address, :phone, :type, :specialty, :sidelines, :events, :website, :facebook, :twitter, :description, :city 
=======
  attr_accessor :name, :address, :phone, :type, :specialty, :sidelines, :events, :website, :facebook, :twitter, :description, :city, :state
>>>>>>> f4c27b0892d578314e7549ffab1270f324634dc1

  def initialize
    @name = nil
    @address = nil
    @phone = nil
    @type = nil
    @specialty = nil
    @sidelines = nil
    @events = nil
    @website = nil
    @facebook = nil
    @twitter = nil
    @description = nil
  end


end
