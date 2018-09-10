class WhatToWatch::RecentlyAdded < WhatToWatch::Show
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def self.section
    0
  end
  
  def self.list(hash)
    puts ""
    puts "=========================="
    puts " Recently Added Movies/TV "
    puts "=========================="
    puts ""
    self.print_list(hash)
  end
  
end