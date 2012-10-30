class DiningHall
  attr_accessor :name, :urls, :tds, :dates, :sunday, :monday,
                :tuesday, :wednesday, :thursday, :friday,
                :saturday, :sunday
  
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
    
    self.get_menus()
  end
  
  def get_menus()
    # Get menu table from dining website, use dinner for dates
    agent = Mechanize.new
    meal_page = agent.get(self.urls['dinner'])
    table = meal_page.search("div.boxbody")
    
    # Scrape all tds into array
    @tds = []
    table.xpath('//tr/td').to_a.each do |td|
      td = td.text.lstrip.rstrip
      tds << td unless (td.gsub(/\s+/, "") == "" or td.gsub(/\s+/, "") == "\u00A0")
    end
    
    # Remove dining hall title, which is the first element in tds
    @tds.shift
    
    # Create array of dates
    tds_clone = @tds.clone
    @dates = @tds.keep_if { |td|
      begin
        DateTime.strptime(td, "%A, %B %d, %Y")
      rescue ArgumentError
        false
      else
        true
      end
    }.map { |day_string|  DateTime.strptime(day_string, "%A, %B %d, %Y") }
    
    # Clone tds to preserve for later methods
    @tds = tds_clone
    
    # Assign dates to days
    # Each day will contain b, l, and d menus
    @dates.each do |date|
      if !(DAYS.index(date.strftime("%A").downcase).nil?)
        self.instance_variable_set("@#{date.strftime("%A").downcase}", Day.new(self, date))
      end
    end
  end
end