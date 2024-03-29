# Greed Dice Game

> Personal solutions to the `about_scoring_project.rb` of the [Ruby Koans](http://www.rubykoans.com)    
> Just trying to solve it with many starting points and as short as possible, for fun.    
> They're in the order I made them except _The Descriptive Way_ which was the last one.

Greed is a dice game where you roll up to five dice to accumulate points. 
The `score()` function will be used to calculate the score of a single roll of the dice.

A greed roll is scored as follows:

* A set of three ones is 1000 points
* A set of three numbers (other than ones) is worth 100 times the    
  number. (e.g. three fives is 500 points).
* A one (that is not part of a set of three) is worth 100 points.
* A five (that is not part of a set of three) is worth 50 points.
* Everything else is worth 0 points.

Examples:

```ruby
score([1,1,1,5,1]) # 1150 points
score([2,3,4,6,2]) # 0 points
score([3,4,5,3,3]) # 350 points
score([1,5,1,2,4]) # 250 points
```

More scoring examples are given in the tests.

Your goal is to write the score method.

* * * *

For running the tests provided, you will need the Minitest gem.

    ruby dice_game_test.rb

To include color from the command line:

    ruby -r minitest/pride dice_game_test.rb
