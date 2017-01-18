# Tictac

An un-winnable game of Tic Tac Toe. The AI will always win or tie.

AI uses the [MinMax](http://en.wikipedia.org/wiki/Minimax) algorithm.

```
        ___________ .__        __
        \__    ___/ |__| _____/  |______    ____
           |    |   |  |/ ___\   __\__  \ _/ ___\
           |    |   |  \  \___|  |  / __ \  \___
           |____|   |__|\___  >__| (____  /\___  >
                            \/          \/     \/
Lets play Tic Tac Toe!

Enter the coordinates for where you want to move
Ex: '0' would move you to the 1st column, 1st row

Press 'q' to Quit

 0 | 1 | 2
-----------
 3 | 4 | 5
-----------
 6 | 7 | 8

Player X's turn
Where to move? :

```

[ ![Codeship Status for markphelps/tictac](https://codeship.com/projects/e92d4f40-bfc1-0134-613e-0ea17c17ebe1/status?branch=master)](https://codeship.com/projects/196712)

`$ git clone https://github.com/markphelps/tictac.git`

## Running

### Docker

Build the image:

	$ docker build -t tictac .

Run interactively:

	$ docker run -it tictac

### Local

Requirements:

- ruby ~> 2.2.3
- bundler ~> 1.7
- rake ~> 10.0

Install dependencies:

    $ bundle install

Build and install the gem:

    $ bundle exec rake install

The gem will install the 'tictac' binary.

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
