v0.3.0 からバージョン管理方式をtagに移行しました。

# PaletteRailsValidators

ActiveModel Based Rails Validators

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'palette_rails_validators', github: 'palettecloud/palette_rails_validators' 
```

And then execute:

    $ bundle

## Usage

```
validates :name, string_format: true
```

## Validations

- `any_presence`
- `boolean_format`
- `date_range_format`
- `date_format`
- `datetime_format`
- `decimal_format`
- `email_domain_format`
- [email_format](docs/validators/email_format_validator.md)
- `email_from_local`
- `fax_number_format`
- `hour_range_format`
- `kana_format`
- `mail_domain_format # deprecated` 
- `month_range_format`
- `name_format # deprecated`
- `name_kana_format # deprecated`
- `order_format`
- `percentage_format`
- `phone_number_format`
- `positive_bigint_format`
- `positive_number_format`
- `postal_code_format  # deprecated`
- `postcode_format`
- `string_format`
- `text_format`
- `time_format`


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/palettecloud/palette_rails_validators. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PaletteRailsValidators project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/palette_rails_validators/blob/master/CODE_OF_CONDUCT.md).
