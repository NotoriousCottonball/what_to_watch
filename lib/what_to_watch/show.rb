class WhatToWatch::Show
attr_accessor :title, :streaming_service
  
  # WhatToWatch::BestMovies.add_shows
  # WhatToWatch::BestMovies.list()
  # {netflix: "n", amazon_prime: "y", hbo_now: "y", hulu: "n", showtime: "y"}
  
  def initialize(title="", streaming_service="")
    @title = title 
    @streaming_service = streaming_service
    self.class.all << self
  end
  
  def self.add_shows
    WhatToWatch::Scraper.scrape_vulture(self)
  end
  
  
  def self.list(hash)
    services = hash.collect do |service, value| 
      if value == "y" 
        service.to_s.split('_').map(&:capitalize).join(' ')
      end
    end
    services.compact!
    
    if services.include?("Hbo Now")
      services << "HBO Now"
    end
   
    self.all.each.with_index(1) do |object, index|
      if services.include?(object.streaming_service)
        puts ""
        puts "Available! #{index}. #{object.title.upcase}. Watch Now on #{object.streaming_service}."
        puts ""
      else
        puts ""
        puts "Sorry..... #{index}. #{object.title.upcase} only on #{object.streaming_service}."
        puts ""
      end
    end
  end
  
end