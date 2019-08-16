class UriFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    unless url?(value) && http?(value)
      record.errors.add(attribute, (options[:message] || :invalid))
    end
  end

  def url?(str)
    URI.parse(str).scheme rescue false
  end

  def http?(str)
    str =~ /\A#{URI::regexp(%w(http https))}\z/ 
  end
end
