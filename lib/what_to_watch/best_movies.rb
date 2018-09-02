class WhatToWatch::BestMovies
  attr_accessor :title, :streaming_service
  
  
  @@all = []
  
  def initialize(title="", streaming_service="")
    @title = title 
    @streaming_service = streaming_service
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def self.reset! 
    @@all = []
  end
  
  def self.rows
    [10, 11]
  end
  
  def self.add_shows
    WhatToWatch::Scraper.scrape_vulture(self)
  end
  
  
  

  
  def self.list(hash)
    services = hash.collect do |service, value| 
      if value == "y" 
        service.to_s.split('_').map(&:capitalize).join(' ').compact
      end
    end
    
    if services.include?("Hbo Now")
      services << "HBO Now"
    end
    
    self.all.each.with_index(1) do |object, index|
      if services.include?(object.streaming_service)
        puts ""
        puts "#{index}. #{object.title}. Available Now on #{object.streaming_service}."
        puts ""
      else
        puts ""
        puts "#{index}. #{object.title}. Sorry. You Don't Have #{object.streaming_service}."
        puts ""
      end
    end
  end
  
  
end
    
        