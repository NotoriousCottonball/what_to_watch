class WhatToWatch::RecentlyAdded < WhatToWatch::Show
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def self.reset! 
    @@all = []
  end
  
  def self.rows
    [1, 2, 3, 4, 5]
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