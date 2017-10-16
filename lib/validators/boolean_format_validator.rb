class BooleanFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if [ true, false ].include?(value)
    record.errors.add( attribute,  :blank )
  end
end
