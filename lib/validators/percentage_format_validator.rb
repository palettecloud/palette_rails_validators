class PercentageFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    record.errors.add(attribute, 'は0〜100の間で設定してください。') if value.negative? || value > 100
  end
end
