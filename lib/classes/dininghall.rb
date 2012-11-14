class DiningHall
  attr_accessor :name, :urls, :breakfast_tds, :lunch_tds, :dinner_tds,
                :dates, :sunday, :monday, :tuesday, :wednesday, :thursday,
                :friday, :saturday, :sunday
  
  # Has days, which have meals
  def initialize(name)
    @name = name
    case @name.downcase
      when "hill"
        dining_hall_path = "hill/"
      when "commons"
        dining_hall_path = "commons/"
      when "kings court"
        dining_hall_path = "kings/"
      when "mcclelland"
        dining_hall_path = "mcclelland/"
    end
    
    @urls = {
    'breakfast' => ROOT_URL + dining_hall_path + BREAKFAST_PATH,
    'lunch' => ROOT_URL + dining_hall_path + LUNCH_PATH,
    'dinner' => ROOT_URL + dining_hall_path + DINNER_PATH,
    }
    
    # Get dates for each day in the current week
    self.get_days()
    
    # Get the tds for each #{meal} for each day of the week
    @urls.each { |meal, _| self.get_meal_tds(meal) }
  end
  
  def get_days()
    @dates = []
    today = Date.today
    @dates << today - today.wday # sunday
    (1..6).each { |n| @dates << @dates[0] + n }
    
    # Assign dates to days
    # Each day will contain b, l, and d menus
    @dates.each do |date|
      if !(DAYS.index(date.strftime("%A").downcase).nil?)
        self.instance_variable_set("@#{date.strftime("%A").downcase}", Day.new(self, date))
      end
    end
  end
  
  def get_meal_tds(meal)
    # Get menu table from dining website, use dinner for dates
    agent = Mechanize.new
    meal_page = agent.get(self.urls[meal])
    table = meal_page.search("div.boxbody")
    
    # Scrape all tds into array
    tds = []
    table.xpath('//tr/td').to_a.each do |td|
      td = td.text.lstrip.rstrip
      tds << td unless (td.gsub(/\s+/, "") == "" or td.gsub(/\s+/, "") == "\u00A0")
    end
    
    # Remove dining hall title, which is the first element in tds
    tds.shift
    
    # Set instance var
    self.instance_variable_set("@#{meal}_tds", tds)
  end
  
end