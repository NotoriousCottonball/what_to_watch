require "open-uri"
require "nokogiri"
require "cgi"
require "pry"


# File Dependencies.
#Load version.rb first 
#to define Module WhatToWatch.

require "what_to_watch/version"
require "what_to_watch/cli"
require "what_to_watch/scraper"
require "what_to_watch/show"
