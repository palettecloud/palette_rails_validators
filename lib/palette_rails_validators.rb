require 'palette_rails_validators/version'
require 'active_model'

require 'constants/palette_length_pattern'
require 'constants/palette_regex_pattern'

autoload :AnyPresenceValidator, 'validators/any_presence_validator'

autoload :BooleanFormatValidator, 'validators/boolean_format_validator'

# @note deprecated
autoload :DateRangeValidator, 'validators/date_range_validator'
autoload :DateRangeFormatValidator, 'validators/date_range_format_validator'

# @note deprecated
autoload :DateValidator, 'validators/date_validator'
autoload :DateFormatValidator, 'validators/date_format_validator'

# @note deprecated
autoload :DatetimeValidator, 'validators/datetime_validator'
autoload :DatetimeFormatValidator, 'validators/datetime_format_validator'

autoload :DecimalFormatValidator, 'validators/decimal_format_validator'

autoload :EmailFormatValidator, 'validators/email_format_validator'

autoload :EmailFromLocalFormatValidator, 'validators/email_from_local_format_validator'

# @note deprecated
autoload :MailDomainFormatValidator, 'validators/mail_domain_format_validator'
autoload :EmailDomainFormatValidator, 'validators/email_domain_format_validator'

autoload :FaxNumberFormatValidator, 'validators/fax_number_format_validator'

# @note deprecated
autoload :HourRangeValidator, 'validators/hour_range_validator'
autoload :HourRangeFormatValidator, 'validators/hour_range_format_validator'

autoload :KanaFormatValidator, 'validators/kana_format_validator'

# @note deprecated
autoload :MonthRangeValidator, 'validators/month_range_validator'
autoload :MonthRangeFormatValidator, 'validators/month_range_format_validator'

autoload :NameFormatValidator, 'validators/name_format_validator'

autoload :NameKanaFormatValidator, 'validators/name_kana_format_validator'

autoload :OrderFormatValidator, 'validators/order_format_validator'

autoload :PercentageFormatValidator, 'validators/percentage_format_validator'

autoload :PhoneNumberFormatValidator, 'validators/phone_number_format_validator'

# @note deprecated
autoload :PositiveBigintValidator, 'validators/positive_bigint_validator'
autoload :PositiveBigintFormatValidator, 'validators/positive_bigint_format_validator'

# @note deprecated
autoload :PositiveNumberValidator, 'validators/positive_number_validator'
autoload :PositiveNumberFormatValidator, 'validators/positive_number_format_validator'

# @note deprecated
autoload :PostalCodeFormatValidator, 'validators/postal_code_format_validator'
autoload :PostcodeFormatValidator, 'validators/postcode_format_validator'

autoload :StringFormatValidator, 'validators/string_format_validator'

autoload :TextFormatValidator, 'validators/text_format_validator'

# @note deprecated
autoload :TimeValidator, 'validators/time_validator'
autoload :TimeFormatValidator, 'validators/time_format_validator'

autoload :UriFormatValidator, 'validators/uri_format_validator'
