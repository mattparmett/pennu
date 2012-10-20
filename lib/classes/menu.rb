class Menu
  # Scrapes for one dining hall, one day, one meal
  def initialize(dining_hall, date, meal)
    @date = date
    @meal = meal
    @dining_hall = dining_hall
    
    # Split dining hall tds array by date delimiter
    # Each child array contains menu titles and items for one day
    days_items = @dining_hall.tds.split do |td|
      begin
        DateTime.strptime(td, "%A, %B %d, %Y")
      rescue ArgumentError
        false
      else
        true
      end
    end
  
    @day_items = Hash[*days_items[DAYS.index(date.strftime("%A").downcase)].flatten]
  end
  
  def to_hash()
    # Return hash of items and titles
    @day_items
  end
  
  def to_s()
    str = "Menu for #{@meal} at #{@dining_hall.name.titlecase} on #{@date.strftime("%A, %B %d, %Y")}:\n"
    @day_items.each do |title, item|
      str += "#{title}: #{item}\n"
    end
    str.rstrip
  end
end