class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

  def city_openings(date1, date2)
    #takes a date range
    #finds listing within that range
    #outputs those listing
    self.listings.select do |listing|
      listing.between?(date1, date2)
    end
    
  end

end
