# pennu: Penn students, get fed. #

pennu is a simple Ruby library (soon to be gem) that allows you to easily retreive the menus of Penn dining halls.

## How to use pennu ##

*This section may change as pennu is developed.  As such, this section may not be fully accurate, but I will try to keep the instructions as current as possible.*

```ruby
require 'pennu'
hill = DiningHall.new('hill')
puts hill.friday.dinner
```

Will yield:
```
Menu for dinner at Hill on Friday, October 19, 2012:
Kettles: Mushroom Barley and Chicken Tortilla Soup
Comfort: Chicken Provencal, Parmesan Polenta, Italian Green Beans and Sauteed Zu
cchini
Flipped: Hamburgers, Hot Dogs, Grilled Marinated Chicken, Vegan Patty and French
 Fries
Expo: Butternut Squash Risotto
Pizza: An Ever Changing Selection of Italian Favorites
Hemispheres: Local Yogurts, Fresh Baked Bagels and Bread Bar, Assorted Pastries
and Desserts, Make your Own Waffle Bar, Ice Cream
Deli: Assorted Breads, Deli Meats and Cheeses made to order
Good 4 You: Tofu and Red Lentil Risotto, Roasted Eggplant, Balsamic Tomatoes
```

## Warnings ##

pennu hasn't yet been extensively tested and may fail at certain edge cases.  I would really appreciate bug reports and pull requests if you happen to stumble on a mishandled edge case.

pennu was written and tested on Windows; some hiccups may result from running pennu on other platforms.  I'd appreciate feedback if any such issues do occur.

## Contributing ##

All contributions are welcome via pull request.

## TODO ##
*	Create gem
* More extensive testing