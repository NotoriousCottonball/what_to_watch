class WhatToWatch::Scraper
 
 
 def self.scrape_vulture(model)
    doc = Nokogiri::HTML(open("http://vulture.com/streaming"))
    model.rows.each do |row|
      block = doc.css("div.what-to-watch.row-#{row}")
      block.css("ul.row li").each do |item|
        model.new(
         item.css("a.title").attr("title").text.strip,
         block.css("h4").text.strip
        )
      end 
    end
  end
       
       
    

  
  
  
  
  
  
end