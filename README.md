# Greed Dice Game

> Solutions to the `about_scoring_project.rb` of the [Ruby Koans](http://www.rubykoans.com)

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

> Note: the following are instructions given by [Exercism](http://exercism.io).

For installation and learning resources, refer to the
[Ruby resources page](http://exercism.io/languages/ruby/resources).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

Run the tests from the exercise directory using the following command:

    ruby dice_game_test.rb

To include color from the command line:

    ruby -r minitest/pride dice_game_test.rb
