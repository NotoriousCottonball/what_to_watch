class WhatToWatch::Show
attr_accessor :title, :streaming_service, :category, :url, :description, :genre_year, :cast
  
  # WhatToWatch::BestMovies.add_shows
  # WhatToWatch::BestMovies.list()
  # {netflix: "y", amazon_prime: "y", hbo_now: "y", hulu: "y", showtime: "y"}
  
  @@all = []
  
  
  def initialize(title="", streaming_service="", category= "")
    @title = title 
    @streaming_service = streaming_service
    @category = category
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  
  #Determine Display Based On User Input Recorded in CLI.streaming_services
  
  
    
  
  
  
  def self.print_item(input)
    object = self.all[input.to_i-1]
    WhatToWatch::Scraper.scrape_imdb(object) if object.url == nil
    puts ""
    puts "===================================="
    puts "     #{object.title.upcase}"
    puts "===================================="
    puts "#{object.genre_year}"
    puts ""
    puts "*** Available on #{object.streaming_service.upcase} ***"
    puts ""
    object.cast.each{|role, people| puts "#{role} #{people}"}
    puts ""
    puts "---Description---"
    puts ""
    puts "#{object.description}"
    puts "[...]"
    puts ""
    puts "For more information"
    puts ""
    puts "===>  #{object.url}"
  end
  
end