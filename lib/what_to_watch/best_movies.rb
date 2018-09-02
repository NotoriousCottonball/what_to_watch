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
  
  
  
 # self.all.select{|object| object.streaming_service ==
  
  def self.list(hash)
    services = hash.collect{|service, value| service.to_s if value == "y"}.compact
    self.all.select{|object| services.include?(object.streaming_service)}
    .each.with_index(1) do |object, index|
      puts "#{index}. "
  end
  
  
end
    
        