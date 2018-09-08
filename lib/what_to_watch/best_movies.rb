class WhatToWatch::BestMovies < WhatToWatch::Show
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def self.reset! 
    @@all = []
  end
  
  def self.section
    3
  end
  
  def self.list(hash)
    puts ""
    puts "======================"
    puts " Best Reviewed Movies "
    puts "======================"
    puts ""
    self.print_list(hash)
  end
end
    
        