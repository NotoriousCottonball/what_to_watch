class WhatToWatch::BestTV
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
    [7, 8, 9]
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