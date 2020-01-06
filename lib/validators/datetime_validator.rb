class DatetimeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    # greater than validation
    if options[:gt].present?
      datetime = options[:gt].try(:lambda?) ? options[:gt].call(record) : options[:gt]
      unless value > datetime
        record.errors[attribute] << (options[:message] || "は " + datetime.to_s(:datetime) + " よりあとに設定してください。" )
      end
    end

    # greater than or equal to validation
    if options[:gte].present?
      datetime = options[:gte].try(:lambda?) ? options[:gte].call(record) : options[:gte]
      unless value >= datetime
        record.errors[attribute] << (options[:message] || "は " + datetime.to_s(:datetime) + " 以降で設定してください。" )
      end
    end

    # less than validation
    if options[:lt].present?
      datetime = options[:lt].try(:lambda?) ? options[:lt].call(record) : options[:lt]
      unless value < datetime
        record.errors[attribute] << (options[:message] || "は " + datetime.to_s(:datetime) + " よりまえに設定してください。" )
      end
    end

    # less than or equal to validation
    if options[:lte].present?
      datetime = options[:lte].try(:lambda?) ? options[:lte].call(record) : options[:lte]
      unless value <= datetime
        record.errors[attribute] << (options[:message] || "は " + datetime.to_s(:datetime) + " 以前で設定してください。" )
      end
    end
  end
end
