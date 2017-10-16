class HourRangeFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    return if (0..24).cover?(value)
    record.errors.add(attribute, :inclusion)
  end
end
