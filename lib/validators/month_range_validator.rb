class MonthRangeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    return if (1..12).cover?(value)
    record.errors.add(attribute, :inclusion)
  end
end
