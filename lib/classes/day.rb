class Day
  attr_accessor :date, :dining_hall, :breakfast, :lunch, :dinner
  def initialize(dining_hall, date)
    @date = date
    @dining_hall = dining_hall
  end
  
  def breakfast()
    # fetch bfast menu for the date
    @breakfast = Meal.new(@dining_hall, @date, 'breakfast')
    @breakfast
  end
  
  def lunch()
    # fetch lunch menu for the date
    @lunch = Meal.new(@dining_hall, @date, 'lunch')
    @lunch
  end
  
  def dinner()
    # fetch dinner menu for the date
    @dinner = Meal.new(@dining_hall, @date, 'dinner')
    @dinner
  end
  
end