# Tictac

An un-winnable game of Tic Tac Toe. The AI will always win or tie. Sorry :(

AI uses the [MinMax](http://en.wikipedia.org/wiki/Minimax) algorithm. 

## Requirements
- ruby ~> 2.1.2
- bundler ~> 1.7
- rake ~> 10.0

## Installation

Clone the source and cd into the project directory.

Then execute:

    $ bundle install

Then build and install the gem:

    $ rake install

## Usage

The gem should install the 'tictac' binary.

Just run:

	$ tictac

## Tests

    $ rake test

	# Running:

	.......................

    Fabulous run in 0.005212s, 4412.8933 runs/s, 10360.7061 assertions/s.
    
    23 runs, 54 assertions, 0 failures, 0 errors, 0 skips
    
## Contributing

1. Fork it ( https://github.com/markphelps/tictac/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
