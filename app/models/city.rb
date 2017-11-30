class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

  def city_openings(datein, dateout)
    #takes a date range
    #finds listing within that range
    #outputs those listing
    openings = []
    self.listings.each do |listings|
      listings.reservations.each do |reservation|
        checkin = reservation.checkin
        checkout = reservation.checkout
        if [datein, checkin].max < [dateout, checkout].min
          openings << listings
        end
      end

      openings

    end


  end
    #     checkin = listing.checkin
    #     checkout = listing.checkout
    #     if max(datein, checkin) < min(dateout, checkout)
    #       openings << listing
    #     end
    #   end
    # end



end
