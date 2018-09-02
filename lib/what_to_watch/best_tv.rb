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
  
  def self.rows
    [7, 8, 9]
  end
  
  def self.add_shows
    WhatToWatch::Scraper.scrape_vulture(self)
  end
  
  
  
end