class WhatToWatch::CLI 
  
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
    which_streaming_services
    WhatToWatch::Scraper.scrape_vulture
    while !exit?
      catch(:main_menu) do
        main_commands
        case @input
        when "1", "2", "3", "4"
          print_list
          while !exit?
            options
            if valid_number?(WhatToWatch::Show.filtered)
              print_item
              while !exit?
              item_options
                if @input == "y"
                  break
                elsif @input == "n"
                  throw(:main_menu)
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


private
    
  
  #CLI Dialogue Methods
  
  def main_commands
    puts ""
    puts "---------"
    puts "MAIN MENU:"
    puts "---------"
    puts "1. Enter 1 to see Recently-Added MOVIES/TELEVISION you can stream now."
    puts "2. Enter 2 to see the Best-Reviewed TELEVISION you can stream now."
    puts "3. Enter 3 to see the Best-Reviewed MOVIES you can stream now."
    puts "4. Enter 4 to see Leaving-Soon MOVIES/TELEVISION you can stream now."
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
  end
  
  def exit 
    puts ""
    puts "**********************************************************"
    puts "See You Next Time for More Great Movie/TV Recommendations!"
    puts "**********************************************************"
    puts ""
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
  
  #CLI Format Methods
  
  def format_services
    services = @streaming_services.collect do |service, value| 
      if value == "y" 
        service.to_s.split('_').join(' ').capitalize
      end
    end
    services.compact!
    services
  end
  
  #CLI Print Methods
  
  def print_list
    category = ""
    banner = ""
    case @input
    when "1" 
      category = "added"
      banner = "Recently-Added/Coming-Soon"
    when "2" 
      category = "tv"
      banner = "Best Reviewed Television"
    when "3" 
      category = "movies"
      banner = "Best Reviewed Movies"
    when "4" 
      category = "expiring"
      banner = "Leaving Soon"
    end 
    puts ""
    puts "============================"
    puts " #{banner} "
    puts "============================"
    puts ""
    WhatToWatch::Show.filter(category)
    WhatToWatch::Show.filtered.each.with_index(1) do |recommendation, index|
      if format_services.include?(recommendation.streaming_service)
        puts ""
        puts "Available! #{index}. #{recommendation.title.upcase}. Watch Now on #{recommendation.streaming_service.capitalize}."
        puts ""
      else
        puts ""
        puts "Sorry..... #{index}. #{recommendation.title.upcase}. Only on #{recommendation.streaming_service.capitalize}."
        puts ""
      end
    end
  end
  
   def print_item
    item = WhatToWatch::Show.filtered[@input.to_i-1]
    WhatToWatch::Scraper.scrape_imdb(item) if item.url == nil
    puts ""
    puts "===================================="
    puts "     #{item.title.upcase}"
    puts "===================================="
    puts "#{item.genre_year}"
    puts ""
    puts "*** Available on #{item.streaming_service.upcase} ***"
    puts ""
    item.cast.each{|role, people| puts "#{role} #{people}"}
    puts ""
    puts "---Description---"
    puts ""
    puts "#{item.description}"
    puts "[...]"
    puts ""
    puts "For more information"
    puts ""
    puts "===>  #{item.url}"
  end
  
  #CLI Logic Methods
  
  def exit?
    @input.downcase == "exit"
  end
  
  def valid_number?(array)
    @input.to_i.between?(1, array.size)
  end
end