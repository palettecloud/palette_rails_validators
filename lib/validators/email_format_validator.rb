class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    if options[:strict]
      unless value =~ Constants::PaletteRegexPattern::EMAIL_STRICT
        record.errors.add(attribute, (options[:message] || :email_format))
      end
    else
      unless value =~ Constants::PaletteRegexPattern::EMAIL
        record.errors.add(attribute, (options[:message] || :email_format))
      end
    end

    if value.size > Constants::PaletteLengthPattern::EMAIL
      record.errors.add(attribute, (options[:message] || :too_long), count: Constants::PaletteLengthPattern::EMAIL)
    end
  end
end
