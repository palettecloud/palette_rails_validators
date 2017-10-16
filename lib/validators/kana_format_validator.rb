class KanaFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    unless value =~ Constants::PaletteRegexPattern::KANA
      record.errors.add(attribute, (options[:message] || :invalid))
    end
    if value.size > Constants::PaletteLengthPattern::STRING
      record.errors.add(attribute, (options[:message] || :too_long), count: Constants::PaletteLengthPattern::STRING)
    end
  end
end
