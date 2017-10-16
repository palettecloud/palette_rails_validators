class FaxNumberFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    unless value =~ Constants::PaletteRegexPattern::FAX
      record.errors.add(attribute, (options[:message] || :invalid))
    end
  end
end
