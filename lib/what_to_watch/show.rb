class WhatToWatch::Show
attr_accessor :title, :streaming_service, :category, :url, :description, :genre_year, :cast
  
  # WhatToWatch::BestMovies.add_shows
  # WhatToWatch::BestMovies.list()
  # {netflix: "y", amazon_prime: "y", hbo_now: "y", hulu: "y", showtime: "y"}
  
  @@all = []
  @@filtered = []
  
  
  def initialize(title="", streaming_service="", category= "")
    @title = title 
    @streaming_service = streaming_service
    @category = category
    @@all << self
  end
  
  def self.filter
    @@filtered = @@all.select{|object| object.category.include?("#{category}")}
  end
  
  def self.filtered
    @@filtered
  end
  
  
  def print_item
    item = WhatToWatch::Show.filtered[input.to_i-1]
    WhatToWatch::Scraper.scrape_imdb(item) if item.url == nil
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