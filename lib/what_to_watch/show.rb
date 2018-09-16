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
  
  def self.filter(selection)
    @@filtered = @@all.select{|object| object.category.include?("#{selection}")}
  end
  
  def self.filtered
    @@filtered
  end
  
  
end