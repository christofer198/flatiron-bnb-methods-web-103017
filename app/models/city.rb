class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

  # def city_openings(datein, dateout)
  #   #takes a date range
  #   #finds listing within that range
  #   #outputs those listing
  #   openings = []
  #   self.listings.each do |listings|
  #     listings.reservations.each do |reservation|
  #       checkin = reservation.checkin
  #       checkout = reservation.checkout
  #       binding.pry
  #       if [datein.to_date, checkin].max > [dateout.to_date, checkout].min
  #         openings << listings
  #       end
  #     end
  #
  #     openings
  #
  #   end
  #
  #
  # end

  def self.highest_ratio_res_to_listings
    binding.pry
  end

end
