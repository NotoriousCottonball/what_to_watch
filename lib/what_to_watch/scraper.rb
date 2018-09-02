class WhatToWatch::Scraper
 
 
 def self.scrape_vulture(model)
    doc = Nokogiri::HTML(open("http://vulture.com/streaming"))
    category = model.new
    category.rows.each |row| do 
      block = doc.css("div.what-to-watch.row-#{row}")
       category. = 
       
       
       #Name: block.css("ul.row li").first.css("a.title").attr("title").text.strip
      
      
      #Service: block.css("h4").text.strip
    
 end
 
  
  #primary > section > div.what-to-watch.row-1 > div > div.what-to-watch-items > ul > li:nth-child(1) > a.title
  
  
  
  
  
  
end