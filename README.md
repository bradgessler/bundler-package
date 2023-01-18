# Bundler::Package

Resolves packages that gems depend on to run in various operating system kernal distributions like Debian, macOS, etc.

The dream? When developers add a new gem to their project and deploy via Docker, a command like this would get a list of packages in the Dockerfile:

```Dockerfile
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y ${bundle package list} \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives
```

For example, the `activestorage` gem would return the `libvips` package for the `ruby` Docker image, which runs Debian.

## Installation

This will start as a bundler plugin.

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

## Usage

TODO: Write instructions on how developers can add package dependencies to their gemspec.

This code and gem is still experimental. Currently to resolve the package distrubition and version, you'll have to run the following:

```ruby
puts Gem::Package.local.version
puts Gem::Package.local.name
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bundler-package. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/bundler-package/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bundler::Package project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/bundler-package/blob/main/CODE_OF_CONDUCT.md).
