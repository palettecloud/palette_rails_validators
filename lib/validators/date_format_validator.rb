class DateFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.nil?
      record.errors[attribute] << "に値を入力してください。"
      return
    end

    # greater than validation
    if options[:gt].present?
      date = options[:gt].try(:lambda?) ? options[:gt].call(record) : options[:gt]
      unless value > date
        record.errors[attribute] << (options[:message] || "は " + date.to_time.to_s(:date) + " よりあとに設定してください。" )
      end
    end

    # greater than or equal to validation
    if options[:gte].present?
      date = options[:gte].try(:lambda?) ? options[:gte].call(record) : options[:gte]
      unless value >= date
        record.errors[attribute] << (options[:message] || "は " + date.to_time.to_s(:date) + " 以降で設定してください。" )
      end
    end

    # less than validation
    if options[:lt].present?
      date = options[:lt].try(:lambda?) ? options[:lt].call(record) : options[:lt]
      unless value < date
        record.errors[attribute] << (options[:message] || "は " + date.to_time.to_s(:date) + " よりまえに設定してください。" )
      end
    end

    # less than or equal to validation
    if options[:lte].present?
      date = options[:lte].try(:lambda?) ? options[:lte].call(record) : options[:lte]
      unless value <= date
        record.errors[attribute] << (options[:message] || "は " + date.to_time.to_s(:date) + " 以前で設定してください。" )
      end
    end
  end
end
