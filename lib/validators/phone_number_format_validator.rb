class PhoneNumberFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    if options[:mobile].present? && options[:mobile]
      # mobile_phone_number
      unless value =~ Constants::PaletteRegexPattern::MOBILE_PHONE
        record.errors.add(attribute, (options[:message] || :invalid))
      end
    else
      # phone_number
      unless value =~ Constants::PaletteRegexPattern::PHONE_NUMBER
        record.errors.add(attribute, (options[:message] || :invalid))
      end
    end

  end
end
