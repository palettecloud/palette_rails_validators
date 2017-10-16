class DecimalFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    scale = options[:scale].to_i
    # 整数部の指定桁数+1桁の数値未満かどうかを判定に使う
    max_value = 10**options[:digit].to_i
    decimals = value.to_s.split('.')

    if scale > 0 # 少数指定あり
      # @note ActiveRecordはvalidationかけると先に自動的に四捨五入して丸めるので注意
      if decimals.size == 2 && decimals.size > scale
        record.errors.add(attribute, (options[:message] || :too_long), count: decimals.last.size)
      end
    end

    if value < 0
      record.errors.add(attribute, (options[:message] || :greater_than), count: 0)
    end

    if value >= max_value
      record.errors.add(attribute, (options[:message] || :less_than), count: max_value)
    end
  end
end
