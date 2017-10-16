class PositiveNumberFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    if options[:string]
      unless value =~ /^([0-9]+|\-[0-9]+)$/
        record.errors.add(attribute, (options[:message] || :not_a_number))
        return
      end
    end
    value = value.to_i
    if value < 0
      record.errors.add(attribute, (options[:message] || :greater_than), count: 0)
    end
    if value > 200_000_000
      record.errors.add(attribute, (options[:message] || :less_than), count: '2億')
    end
  end
end
