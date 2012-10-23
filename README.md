# pennu: Penn students, get fed. #

pennu is a simple Ruby gem that allows you to easily retreive the menus of Penn dining halls.

## Installation ##

pennu is hosted on rubygems, so installation is as simple as:

```gem install pennu```

## How to use pennu ##

*This section may change as pennu is developed.  As such, this section may not be fully accurate, but I will try to keep the instructions as current as possible.*

Running:

```ruby
require 'pennu'

# Download weekly menu for all meals at given dining hall
# Supported dining halls = ["hill", "commons", "kings court"]
hill = DiningHall.new('hill')

# You can call meals by meal name and day of week
puts hill.friday.dinner
```

will yield:
```
Menu for dinner at Hill on Friday, October 19, 2012:
Kettles: Mushroom Barley and Chicken Tortilla Soup
Comfort: Chicken Provencal, Parmesan Polenta, Italian Green Beans and Sauteed Zucchini
Flipped: Hamburgers, Hot Dogs, Grilled Marinated Chicken, Vegan Patty and French Fries
Expo: Butternut Squash Risotto
Pizza: An Ever Changing Selection of Italian Favorites
Hemispheres: Local Yogurts, Fresh Baked Bagels and Bread Bar, Assorted Pastriesand Desserts, Make your Own Waffle Bar, Ice Cream
Deli: Assorted Breads, Deli Meats and Cheeses made to order
Good 4 You: Tofu and Red Lentil Risotto, Roasted Eggplant, Balsamic Tomatoes
```

Calling ``` hill.friday.dinner``` will yield a ``` String``` like the output above.  The menu items are more accessible as a hash of titles (e.g. ```Kettles``` and items (e.g. ```Mushroom Barley and Chicken Tortilla Soup```).  To get the menu as a hash, simple call ```to_hash```.  Running:

```ruby
puts hill.friday.dinner.to_hash.inspect
```

will yield:
```
{"Kettles"=>"Mushroom Barley and Chicken Tortilla Soup", "Comfort"=>"Chicken Provencal, Parmesan Polenta, Italian Green Beans and Sauteed Zucchini", "Flipped"=>"Hamburgers, Hot Dogs, Grilled Marinated Chicken, Vegan Patty and French Fries", "Expo"=>"Butternut Squash Risotto", "Pizza"=>"An Ever Changing Selection of Italian Favorites", "Hemispheres"=>"Local Yogurts, Fresh Baked Bagels and Bread Bar, Assorted Pastries and Desserts, Make your Own Waffle Bar, Ice Cream", "Deli"=>"Assorted Breads, Deli Meats and Cheeses made to order", "Good 4 You"=>"Tofu and Red Lentil Risotto, Roasted Eggplant, Balsamic Tomatoes"}
```

## Warnings ##

pennu hasn't yet been extensively tested and may fail at certain edge cases.  I would really appreciate bug reports and pull requests if you happen to stumble on a mishandled edge case.

pennu was written and tested on Windows; some hiccups may result from running pennu on other platforms.  I'd appreciate feedback if any such issues do occur.

## Contributing ##

All contributions are welcome via pull request.

## TODO ##
* More extensive testing