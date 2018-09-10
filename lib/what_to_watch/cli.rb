class WhatToWatch::CLI 
  attr_accessor :input, :streaming_services
  
  def initialize 
   @input = ""
   @streaming_services = {netflix: "n", amazon_prime: "n", hbo_now: "n", hulu: "n", showtime: "n"}
   puts "==========================================" 
   puts %q[
 __        ___           _     _         
 \ \      / / |__   __ _| |_  | |_ ___   
  \ \ /\ / /| '_ \ / _` | __| | __/ _ \  
   \ V  V / | | | | (_| | |_  | || (_) | 
 __ \_/\_/ _|_| |_|\__,_|\__|  \__\___/  
 \ \      / /_ _| |_ ___| |__            
  \ \ /\ / / _` | __/ __| '_ \           
   \ V  V / (_| | || (__| | | |          
    \_/\_/ \__,_|\__\___|_| |_|          
  
  ]
   puts "=========================================="
   puts ""
   puts "Welcome to What To Watch!"
   puts ""
  end 
   
  def start
    while !exit?
    which_streaming_services
    while !exit?
      main_commands
      while !exit?
      case @input
      when "1"
        WhatToWatch::BestMovies.add_shows
        WhatToWatch::BestMovies.list(@streaming_services)
        options
        while !exit?
        if valid_number?(WhatToWatch::BestMovies.all)
          WhatToWatch::BestMovies.print_item(@input)
          item_options
          while !exit?
          if @input == "y"
            options
            break
          elsif @input == "n"
            WhatToWatch::BestMovies.reset!
            start
          else 
            invalid_command
          end
          end
        else
           invalid_command
        end
        end
      when "2"
        WhatToWatch::BestTV.add_shows
        WhatToWatch::BestTV.list(@streaming_services)
        options
        while !exit?
        if valid_number?(WhatToWatch::BestTV.all)
          WhatToWatch::BestTV.print_item(@input)
          item_options
          while !exit?
          if @input == "y"
            options
            break
          elsif @input == "n"
            WhatToWatch::BestTV.reset!
            start
          else 
            invalid_command
          end
          end
        else
           invalid_command
        end
        end
      when "3"
        WhatToWatch::RecentlyAdded.add_shows
        WhatToWatch::RecentlyAdded.list(@streaming_services)
        options
        while !exit?
        if valid_number?(WhatToWatch::RecentlyAdded.all)
          WhatToWatch::RecentlyAdded.print_item(@input)
          item_options
          while !exit?
          if @input == "y"
            options
            break
          elsif @input == "n"
            WhatToWatch::RecentlyAdded.reset!
            start
          else 
            invalid_command
          end
          end
        else
           invalid_command
        end
        end
      else
        invalid_command
      end
      end
    end
    end
    exit
  end
    
  #CLI Dialogue Methods
  
  def main_commands
    puts ""
    puts "---------"
    puts "MAIN MENU:"
    puts "---------"
    puts "1. Enter 1 to see the Best-Reviewed MOVIES you can stream now."
    puts "2. Enter 2 to see the Best-Reviewed TELEVISION you can stream now."
    puts "3. Enter 3 to see Recently-Added MOVIES/TELEVISION you can stream now."
    puts ""
    puts "Exit: Type exit"
    puts "---------------"
    puts ""
    @input = gets.strip
  end
  
  def options
    puts ""
    puts "-------"
    puts "OPTIONS:"
    puts "-------"
    puts "Enter The Number of the Selection to See Details and Information."
    puts ""
    puts "Exit: Type exit"
    puts "---------------"
    puts ""
    @input = gets.strip
  end
  
  def item_options
    puts ""
    puts "-------"
    puts "OPTIONS"
    puts "-------"
    puts "Enter y to Get Info/Details for Another Selection"
    puts "Enter n to Go Back to MAIN MENU"
    puts ""
    puts "Exit: Type exit"
    puts "---------------"
    puts ""
    @input = gets.strip.downcase
  end
  
  def invalid_command
    puts ""
    puts "I'm sorry, I don't recognize that Command."
    puts "Please Try Again"
    puts ""
    @input = gets.strip.downcase
  end
  
  def exit 
    puts ""
    puts "**********************************************************"
    puts "See You Next Time for More Great Movie/TV Recommendations!"
    puts "**********************************************************"
  end
  
  def which_streaming_services
    puts ""
    puts "Which Streaming Services do You Have Access To?"
    puts ""
    puts "Please Enter y or n to Answer each Question:"
    puts "(Exit: Type exit)"
    puts ""
    puts "1. Do You have Netflix?"
    @input = gets.strip.downcase
    while !exit?
    if @input == "y"
      @streaming_services[:netflix] = "y"
      break
    elsif @input == "n"
      @streaming_services[:netflix] = "n"
      break
    else 
       invalid_command
    end
    end
    
    return if exit?
    puts "2. Do You have Amazon Prime?"
    @input = gets.strip.downcase
    while !exit?
    if @input == "y"
      @streaming_services[:amazon_prime] = "y"
      break
    elsif @input == "n"
      @streaming_services[:amazon_prime] = "n"
      break
    else 
       invalid_command
    end
    end
    
    return if exit?
    puts "3. Do You have HBO?"
    @input = gets.strip.downcase
    while !exit?
    if @input == "y"
      @streaming_services[:hbo_now] = "y"
      break
    elsif @input == "n"
      @streaming_services[:hbo_now] = "n"
      break
    else 
       invalid_command
    end
    end
    
    return if exit?
    puts "4. Do You have HULU?"
    @input = gets.strip.downcase
    while !exit?
    if @input == "y"
      @streaming_services[:hulu] = "y"
      break
    elsif @input == "n"
      @streaming_services[:hulu] = "n"
      break
    else 
       invalid_command
    end
    end
    
    return if exit?
    puts "5. Do You have Showtime?"
    @input = gets.strip.downcase
    while !exit?
    if @input == "y"
      @streaming_services[:showtime] = "y"
      break
    elsif @input == "n"
      @streaming_services[:showtime] = "n"
      break
    else 
       invalid_command
    end
    end
  end
  
  #CLI Logic Methods
  
  def exit?
    @input.downcase == "exit"
  end
  
  def valid_number?(array)
    @input.to_i.between?(1, array.size)
  end
end