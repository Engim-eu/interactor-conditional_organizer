# Interactor::ConditionalOrganizer

Interactor::ConditionalOrganizer is an extension of [the interactor gem](https://github.com/collectiveidea/interactor)

## Installation

Install the gem and add to the application's Gemfile by executing:

```shell
bundle add interactor-conditional_organizer
```

If bundler is not being used to manage dependencies, install the gem by executing:

```shell
gem install  interactor-conditional_organizer
```

## Usage

It's as easy to use as follows:

```ruby
class ExampleConditionalOrganizer
  include Interactor::ConditionalOrganizer

  def true_method
    true
  end

  def false_method
    false
  end

  organize [{ class: CalledInteractor, if: :true_method },
            { class: NotCalledInteractor, if: :false_method }]
end
```

Create a normal organizer, but include Interactor::ConditionalOrganizer instead.  
In the organize method pass an array of Hashes with the following keys:

- class - Class of the Organizer to Call
- if - symbol that identifies a method in the organizer. If it returns true, the interactor will be called.

Inside your conditional method you have access to the interactor's context.

I highly suggest using delegate on the Conditional Organizer, if possible:

```ruby
class ExampleConditionalOrganizer
  include Interactor::ConditionalOrganizer

  before do
    @element = context.element
  end
  
  delegate :mode_a?, :mode_b?, to: :@element

  organize [{ class: ModeAInteractor, if: :mode_a? },
            { class: ModeBInteractor, if: :mode_b? }]

end
```

This way mode_a? and mode_b? will be called on @element

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/interactor-conditional_organizer.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
