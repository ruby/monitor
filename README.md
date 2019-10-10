# Monitor

In concurrent programming, a monitor is an object or module intended to be
used safely by more than one thread.  The defining characteristic of a
monitor is that its methods are executed with mutual exclusion.  That is, at
each point in time, at most one thread may be executing any of its methods.
This mutual exclusion greatly simplifies reasoning about the implementation
of monitors compared to reasoning about parallel code that updates a data
structure.

You can read more about the general principles on the Wikipedia page for
Monitors[http://en.wikipedia.org/wiki/Monitor_%28synchronization%29]

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'monitor'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install monitor

## Usage

```ruby
require 'monitor.rb'

buf = []
buf.extend(MonitorMixin)
empty_cond = buf.new_cond

# consumer
Thread.start do
  loop do
    buf.synchronize do
      empty_cond.wait_while { buf.empty? }
      print buf.shift
    end
  end
end

# producer
while line = ARGF.gets
  buf.synchronize do
    buf.push(line)
    empty_cond.signal
  end
end
```

The consumer thread waits for the producer thread to push a line to buf
while <tt>buf.empty?</tt>.  The producer thread (main thread) reads a
line from ARGF and pushes it into buf then calls <tt>empty_cond.signal</tt>
to notify the consumer thread of new data.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ruby/monitor.

