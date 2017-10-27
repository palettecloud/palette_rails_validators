class TimeFormatValidator < ActiveModel::EachValidator
  # 時刻フィールド用バリデータ
  # 対応フィールドタイプ： DateTime、Time
  # オプション：
  #   より大きい： time: { gt: *time_option }
  #   以上： time: { gte: *time_option }
  #   より小さい： time: { lt: *time_option }
  #   以下： time: { lte: *time_option }
  #   *time_option： [hour] or [hour, minute] or [hour, minute, second]
  # 備考：
  #   _time_option_ の _minute_ や _second_ が省略された場合は 0 として扱われる
  def validate_each(record, attribute, value)
    return if value.blank?

    # greater than validation
    if options[:gt].present?
      unless compare(value, options[:gt], :>)
        record.errors[attribute] << (options[:message] || "は " + time_option_to_array(options[:gt]).map(&:to_s).join(':') + " よりあとに設定してください。" )
      end
    end

    # greater than or equal to validation
    if options[:gte].present?
      unless compare(value, options[:gte], :>=)
        record.errors[attribute] << (options[:message] || "は " + time_option_to_array(options[:gte]).map(&:to_s).join(':') + " 以降で設定してください。" )
      end
    end

    # less than validation
    if options[:lt].present?
      unless compare(value, options[:lt], :<)
        record.errors[attribute] << (options[:message] || "は " + time_option_to_array(options[:lt]).map(&:to_s).join(':') + " よりまえに設定してください。" )
      end
    end

    # less than or equal to validation
    if options[:lte].present?
      unless compare(value, options[:lte], :<=)
        record.errors[attribute] << (options[:message] || "は " + time_option_to_array(options[:lte]).map(&:to_s).join(':') + " 以前で設定してください。" )
      end
    end
  end

  def compare(form_value, option_value, method)
    option_hour, option_minute, option_second = time_option_to_array(option_value)

    form_time   = DateTime.new(2000, 1, 1, form_value.to_datetime.hour, form_value.to_datetime.minute, form_value.to_datetime.second)
    option_time = DateTime.new(2000, 1, 1, option_hour, option_minute, option_second)

    form_time.send(method, option_time)
  end

  # 比較用の時間は [hour] [hour, minute] [hour, minute, second] のいずれかで指定
  # 未指定なら 0 とみなされる
  # ex) [12] => 12:00:00
  def time_option_to_array(option)
    (option + [0, 0])[0..2]
  end
end
