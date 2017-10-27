# If presence: true is described for Boolean, it gets caught when its value is false.
# Therefore, when verifying emptiness against Boolean, use the following validator.
class BooleanPresenceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :blank) if value.nil?
  end
end
