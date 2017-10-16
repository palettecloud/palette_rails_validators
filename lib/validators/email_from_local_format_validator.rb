class EmailFromLocalFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) if value&.include?('@')
  end
end
