class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

  def city_openings(date1, date2)
      self.listings.joins(host: :reservations).where.not('reservations.checkin >= ? and reservations.checkout <= ?', date1, date2)
  end

  def self.highest_ratio_res_to_listings
    ratio = {}

    self.all.each do |city|
      listings = city.listings.count
      reservations = 0
      city.listings.each do |listing|
        reservations += listing.reservations.count
      end
      ratio[city] = (reservations.to_f/listings.to_f)

    end

    ratio.max_by{|k,v| v}[0]

  end

  def self.most_res
    ratio = {}

    self.all.each do |city|
      reservations = 0
      city.listings.each do |listing|
        reservations += listing.reservations.count
      end
      ratio[city] = (reservations)

    end

    ratio.max_by{|k,v| v}[0]

  end

end
