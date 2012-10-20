class Day
  attr_accessor :date, :breakfast, :lunch, :dinner
  def initialize(dining_hall, date)
    @date = date
    @breakfast = Menu.new(dining_hall, date, 'breakfast')
    @lunch = Menu.new(dining_hall, date, 'lunch')
    @dinner = Menu.new(dining_hall, date, 'dinner')
  end
end