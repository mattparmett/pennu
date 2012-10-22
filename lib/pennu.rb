# Ruby gem that retrieves menus for Penn dining halls.
# Written by Matt Parmett, W'14 C'14

# Requires
require 'mechanize'
require 'date'

# Load classes
Dir[File.dirname(__FILE__) + "/classes/*.rb"].each { |file| require file }

# Constants
ROOT_URL = "http://www.diningatpenn.com/penn/cafes/residential/"
BREAKFAST_PATH = "weekly_menu2.html"
LUNCH_PATH = "weekly_menu.html"
DINNER_PATH = "weekly_menu3.html"
DAYS = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]