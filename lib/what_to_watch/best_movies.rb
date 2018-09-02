class WhatToWatch::BestMovies < WhatToWatch::Show
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def self.reset! 
    @@all = []
  end
  
  def self.rows
    [10, 11]
  end
  
end
    
        