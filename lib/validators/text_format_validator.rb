class TextFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    if value.size > Constants::PaletteLengthPattern::TEXT
      record.errors.add(attribute, (options[:message] || :too_long), count: Constants::PaletteLengthPattern::TEXT)
    end
  end
end
