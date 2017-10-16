class DateRangeFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    return if (1..31).cover?(value)
    record.errors.add(attribute, :inclusion)
  end
end
