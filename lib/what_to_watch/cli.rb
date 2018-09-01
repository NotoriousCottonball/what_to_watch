class WhatToWatch::CLI 
  attr_accessor :input, :streaming_services
  
  def initialize 
   @input = ""
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
    which_streaming_services
    while !exit?
      main_commands
      while !exit?
      case @input
      when "1"
        print ["a", "b", "c"]
        options
        while !exit?
        if valid_number?(["a", "b", "c"])
          print ["a", "b", "c"][@input.to_i-1]
          item_options
          while !exit?
          if @input == "y"
            options
            break
          elsif @input == "n"
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
        print ["a", "b", "c"]
        options
        while !exit?
        if valid_number?(["a", "b", "c"])
          print ["a", "b", "c"][@input.to_i-1]
          item_options
          while !exit?
          if @input == "y"
            options
            break
          elsif @input == "n"
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
        print ["a", "b", "c"]
        options
        while !exit?
        if valid_number?(["a", "b", "c"])
          print ["a", "b", "c"][@input.to_i-1]
          item_options
          while !exit?
          if @input == "y"
            options
            break
          elsif @input == "n"
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
    exit
  end
    
  #CLI Dialogue Methods
  
  def main_commands
    puts ""
    puts "-------"
    puts "OPTIONS:"
    puts "-------"
    puts "1. Enter 1 to see the Best-Reviewed MOVIES you can stream now."
    puts "2. Enter 2 to see the Best-Reviewed TELEVISION you can stream now."
    puts "3. Enter 3 to see Recently-Added Movies/Television you can stream now."
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
    puts "Enter y to See Info/Details for Another Selection"
    puts "Enter n to Start Over"
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
    puts "See You Next Time for More Great Movie/TV Recommendations!"
  end
  
  def which_streaming_services
    puts "Which Streaming Services do You Have Access To?"
    puts ""
    puts "Please Enter y or n to Answer each Question:"
    
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
    
    puts "3. Do You have HBO?"
    @input = gets.strip.downcase
    while !exit?
    if @input == "y"
      @streaming_services[:hbo] = "y"
      break
    elsif @input == "n"
      @streaming_services[:hbo] = "n"
      break
    else 
       invalid_command
    end
    end
    
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