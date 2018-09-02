class WhatToWatch::BestMovies
  
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def self.rows
    [10, 11]
  end
  
  def self.add_shows
  end
  
  def self.list(hash)
    hash.collect{|service, value| service.to_s if value == "y"}
    .compact.each do |service|
      case service
      when "netflix"
      when "amazon_prime"
      when "hbo"
      when "hulu"
      when "showtime"
      end
    end
  end
  
  
end
    
        