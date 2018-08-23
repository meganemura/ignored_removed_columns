# IgnoredRemovedColumns

## Installation

```ruby
gem 'ignored_removed_columns'
```

## Usage

```console
$ rake ignored_removed_columns:check
Found removed or typo columns defined in ignored_columns
--------------------------------------------------------
Post:
  - published
  - archived
```

This means:

`Post` class defines `published` (maybe removed) and `archivedd` (maybe typo) ignored_columns, but the related table (commonly `posts`) does not have those columns. So, you can remove those from its ignored_columns.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/meganemura/ignored_removed_columns.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
