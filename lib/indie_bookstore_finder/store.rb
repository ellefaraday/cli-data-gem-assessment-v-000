class IndieBookstoreFinder::Store

  attr_accessor :name, :address, :phone, :type, :specialty, :sidelines, :events, :website, :facebook, :twitter, :description, :city


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
