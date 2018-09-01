class WhatToWatch::CLI 
  attr_accessor :input
  
  def initialize 
   @input = nil
   puts "=======================================================================" 
   puts %q[
 _  _  _  _   __  ____      ____  __        _  _   __  ____  ___  _  _ 
/ )( \/ )( \ / _\(_  _)    (_  _)/  \      / )( \ / _\(_  _)/ __)/ )( \
\ /\ /) __ (/    \ )(  ____  )( (  O )____ \ /\ //    \ )( ( (__ ) __ (
(_/\_)\_)(_/\_/\_/(__)(____)(__) \__/(____)(_/\_)\_/\_/(__) \___)\_)(_/
 
   ]
   puts "======================================================================="
   puts ""
   puts ""
   puts "Welcome to What To Watch!"
   puts ""
  end 
   
  def start
   while input != "exit"
  end 
  
  
  #CLI Dialogue Methods
  def which_streaming_services
  end
  
  def main_menu 
  end
  
  def options
  end
  
  def invalid_command 
  end
  
  def exit 
    puts "See You Next Time for More Great Movie/TV Recommendations!"
  end
  
  #CLI Logic Methods
  def exit?
    @input.downcase == "exit"
  end
  
  def valid_number?(array)
    @input.to_i.between?(1, array.size)
  end
end