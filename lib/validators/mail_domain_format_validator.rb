class MailDomainFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    unless value =~ Constants::PaletteRegexPattern::EMAIL_DOMAIN
      record.errors.add(attribute, (options[:message] || :email_format))
    end
    if value.size > Constants::PaletteLengthPattern::EMAIL_DOMAIN
      record.errors.add(attribute, (options[:message] || :too_long), count: Constants::PaletteLengthPattern::EMAIL_DOMAIN)
    end
  end
end
