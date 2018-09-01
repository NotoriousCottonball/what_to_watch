class WhatToWatch::Scraper
 
 
 def self.scrape_vulture(selector)
    doc = Nokogiri::HTML(open("http://vulture.com/streaming"))
    doc.css(selector).each do |service|
    end
 end
 
  
  
  
  
  
  
  
  
end