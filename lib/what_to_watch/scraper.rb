class WhatToWatch::Scraper
 
 
 def self.scrape_vulture(model)
    doc = Nokogiri::HTML(open("http://vulture.com/streaming"))
    block = doc.css("div[data-editable='main']")[model.section]
    block.css("section").drop(0).each do |item|
      model.new(
        item.css("div[itemprop='caption'] a").text.strip.gsub("  ", " ")
        block.css("section")[0].css("h3").text.strip
        )
    end 
  end
  
  #Scrape Search Page on imdb.com to determine the Item Page URL
  
  def self.get_item_page(object) 
    search_results_page = Nokogiri::HTML(open("https://www.imdb.com/find?s=tt&q=" + 
    CGI::escape(object.title.gsub("Season ", ""))))
    
    url = "https://www.imdb.com" + 
    "#{search_results_page.css("td a").attribute("href").value}"
  end
  
  
  def self.scrape_imdb(object)
    object.url = self.get_item_page(object)
    item_page = Nokogiri::HTML(open(object.url))
    object.description = item_page.css("div.summary_text").text.strip
    object.genre_year = item_page.css("div.subtext a").collect{|tag| tag.text.strip.gsub("\u2013","-")}.join("  |  ")
    object.cast = {} 
    item_page.css("div.credit_summary_item").each do |category|
      object.cast[category.css("h4").text.strip] = category.css("a").collect{|tag|tag.text.strip}.
      join(", ").gsub(", See full cast & crew", "")
    end
  end
  
end