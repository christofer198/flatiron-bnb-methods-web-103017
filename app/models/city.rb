class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

  def city_openings(datein, dateout)
    #takes a date range
    #finds listing within that range
    #outputs those listing
    openings = []
    self.listings.each do |listings|
      listings.each do |listing|
        #listing checkin
        checkin = listing.checkin
        checkout = listing.checkout
        if max(datein, checkin) < min(dateout, checkout)
          openings << listing
        end
      end
    end

  end

end
