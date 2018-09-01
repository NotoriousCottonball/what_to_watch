class WhatToWatch::CLI 
  attr_accessor :input, :streaming_services
  
  def initialize 
   @input = nil
   @streaming_services = {netflix: "n", amazon_prime: "n", hbo: "n", hulu: "n", showtime: "n"}
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
    while !exit?
    which_streaming_services
    main_commands
    
    case @input
    when "1" 
    when "2"
    when "3"
    else
      invalid_command
    end
    
    options
    
    
    
    self.streaming_services.each {|service, answer| if answer == "y"}
    
    
    
    
    if @input == ""
  end
end 
  
  
  #CLI Dialogue Methods
  def which_streaming_services
    puts "Which Streaming Services do You Have Access To?"
    puts ""
    puts "Please Enter y or n to Answer each Question:"
    
    puts "1. Do You have Netflix?"
    @input = gets.strip.downcase
    if @input == "y"
      @streaming_services[:netflix] = "y"
    elsif @input == "n"
       @streaming_services[:netflix] = "n"
    else 
       invalid_command
    end
    
    puts "2. Do You have Amazon Prime?"
    @input = gets.strip.downcase
    if @input == "y"
      @streaming_services[:amazon_prime] = "y"
    elsif @input == "n"
       @streaming_services[:amazon_prime] = "n"
    else 
       invalid_command
    end
    
    puts "3. Do You have HBO?"
    @input = gets.strip.downcase
    if @input == "y"
      @streaming_services[:hbo] = "y"
    elsif @input == "n"
       @streaming_services[:hbo] = "n"
    else 
       invalid_command
    end
    
    puts "4. Do You have HULU?"
    @input = gets.strip.downcase
    if @input == "y"
      @streaming_services[:hulu] = "y"
    elsif @input == "n"
       @streaming_services[:hulu] = "n"
    else 
       invalid_command
    end
    
    puts "5. Do You have Showtime?"
    @input = gets.strip.downcase
    if @input == "y"
      @streaming_services[:showtime] = "y"
    elsif @input == "n"
       @streaming_services[:showtime] = "n"
    else 
       invalid_command
    end
    @streaming_services
  end
  
  def main_commands
    puts ""
    puts "-------"
    puts "OPTIONS:"
    puts "-------"
    puts "1. Enter 1 to see the Best-Reviewed Movies you can stream now."
    puts "2. Enter 2 to see the Best-Reviewed Television you can stream now."
    puts "3. Enter 3 to see Recently-Added Movies/Television you can stream now."
    puts ""
    puts "exit: exit"
    @input = gets.strip
  end
  
  def options
    
  end
  
  def invalid_command
    puts ""
    puts "I'm sorry, I don't recognize that Command."
    puts "Please Try Again"
    puts ""
    @input = gets.strip.downcase
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