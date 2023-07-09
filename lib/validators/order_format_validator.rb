class OrderFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    unless value.is_a? Integer
      record.errors.add(attribute, (options[:message] || :not_a_number))
      return
    end
    if value < 1
      record.errors.add(attribute, (options[:message] || :greater_than), count: 1)
    end
    if value > 200_000_000
      record.errors.add(attribute, (options[:message] || :less_than), count: '2億')
    end
  end
end
