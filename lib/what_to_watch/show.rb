class WhatToWatch::Show
attr_accessor :title, :streaming_service, :description 
  
  # WhatToWatch::BestMovies.add_shows
  # WhatToWatch::BestMovies.list()
  # {netflix: "y", amazon_prime: "n", hbo_now: "y", hulu: "n", showtime: "y"}
  
  def initialize(title="", streaming_service="")
    @title = title 
    @streaming_service = streaming_service
    self.class.all << self
  end
  
  def self.add_shows
    WhatToWatch::Scraper.scrape_vulture(self)
  end
  
  #Determine Display Based On User Input Recorded in CLI.streaming_services
  
  def self.services(hash)
    services = hash.collect do |service, value| 
      if value == "y" 
        service.to_s.split('_').map(&:capitalize).join(' ')
      end
    end
    services.compact!
    if services.include?("Hbo Now")
      services << "HBO Now"
    end
    services
  end
    
  
  def self.print_list(hash)
    self.all.each.with_index(1) do |object, index|
      if self.services(hash).include?(object.streaming_service)
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
  
  
  def self.print_item(input)
    object = self.all[input.to_i-1]
    WhatToWatch::Scraper.scrape_imdb(object)
    
  end
  
end