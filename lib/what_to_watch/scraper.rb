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
  
  #Scrape Search Page on imdb.com to determine the Item Page
  
  def self.get_item_page(object) 
    search_results_page = Nokogiri::HTML(open("https://www.imdb.com/find?s=tt&q=" + CGI::escape(object.title)))
    
  
  
  def self.scrape_imdb(object)
    self.get_item_page(object)
  end

  
  
end