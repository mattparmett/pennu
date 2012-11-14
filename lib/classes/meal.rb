class Meal
  # Scrapes for one dining hall, one day, one meal
  def initialize(dining_hall, date, meal)
    @date = date
    @meal = meal
    @dining_hall = dining_hall
    
    @day_items = self.get_day_items(@meal, @date)
  end
  
  def to_hash()
    # Add date key to beginning of hash and
    # return hash of items and titles
    {'date' => @date.to_s}.merge @day_items
  end
  
  def to_s()
    str = "Menu for #{@meal} at #{@dining_hall.name.titlecase} on #{@date.strftime("%A, %B %d, %Y")}:\n"
    @day_items.each do |title, item|
      str += "#{title}: #{item}\n"
    end
    str.rstrip
  end
  
  def fetch_menu(meal)
    # Get menu table from dining website, use dinner for dates
    agent = Mechanize.new
    meal_page = agent.get(@dining_hall.urls[meal])
    table = meal_page.search("div.boxbody")
    
    # Scrape all tds into array
    @tds = []
    table.xpath('//tr/td').to_a.each do |td|
      td = td.text.lstrip.rstrip
      @tds << td unless (td.gsub(/\s+/, "") == "" or td.gsub(/\s+/, "") == "\u00A0")
    end
    
    # Remove dining hall title, which is the first element in tds
    @tds.shift
  end
  
  def get_day_items(meal, date)
    # Split dining hall tds array by date delimiter
    # Each child array contains menu titles and items for one day
    tds = @dining_hall.instance_variable_get("@#{meal}_tds")
    days_items = tds.split do |td|
      begin
        DateTime.strptime(td, "%A, %B %d, %Y")
      rescue ArgumentError
        false
      else
        true
      end
    end
    
    begin
      Hash[*days_items[DAYS.index(date.strftime("%A").downcase) + 1].flatten]
    rescue NoMethodError => e
      raise NoDataError, "Menu data unavailable for this meal."
    end
  end
  
end