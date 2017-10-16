class AnyPresenceValidator < ActiveModel::Validator
  def validate(record)
    return if options[:fields].blank?
    unless options[:fields].any? { |field| record.try(field).present? }
      record.errors[:base] << options[:fields].map { |field| record.class.human_attribute_name(field) }.join(I18n.t('or')) + "は必須項目です。"
      record.errors.add(options[:fields].join('_or_'), options[:fields].map { |field| record.class.human_attribute_name(field) }.join(I18n.t('or')) + "は必須項目です。")
    end
  end
end
