class WhatToWatch::BestTV < WhatToWatch::Show
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def self.reset! 
    @@all = []
  end
  
  def self.rows
    [7, 8, 9]
  end
  
  def self.list(hash)
    puts ""
    puts "=========================="
    puts " Best Reviewed Television "
    puts "=========================="
    puts ""
    self.print_list(hash)
  end

end