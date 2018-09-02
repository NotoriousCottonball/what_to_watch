class WhatToWatch::Scraper
 
 
 def self.scrape_vulture(selector)
    doc = Nokogiri::HTML(open("http://vulture.com/streaming"))
    doc.css("div.what-to-watch").first     
    end
 end
 
  
  
  
  
  
  
  
  
end