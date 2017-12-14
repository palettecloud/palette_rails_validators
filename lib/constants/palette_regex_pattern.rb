module Constants
  module PaletteRegexPattern
    EMAIL            = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    EMAIL_STRICT_PRE = /\A([\w+\-]+\.)*[\w+\-]+\z/
    EMAIL_STRICT     = /\A([\w+\-]+\.)*[\w+\-]+@[a-z\d\-.]+\.[a-z]+\z/i
    EMAIL_DOMAIN     = /\A([A-Za-z0-9][A-Za-z0-9\-]{0,61}[A-Za-z0-9]\.)+[A-Za-z]+\z/
    PASSWORD         = /\A(?=[!-~]*[\d]+[!-~]*)(?=[!-~]*[a-z]+[!-~]*)[!-~]*[A-Z]+[!-~]*\z/
    POSTCODE         = /\A\d{3}\-\d{4}\z/
    PHONE_NUMBER     = /\A0(\d{9,10}|\d{1,4}\-\d{1,4}\-?\d{1,4})\z/
    FAX              = /\A[0-9\-]{1,32}\z/
    # 全半角カタカナに加えて、全半角の英数字・ハイフン・中黒・スペース、()を許可
    KANA             = /\A[\p{katakana}Ａ-Ｚａ-ｚ０-９A-Za-z0-9ー－\-・･　\s\(\)（）]+\z/u
    MOBILE_PHONE     = /\A0[1-9]0-?\d{4}-?\d{4}\z/
    IPADDR           = /\A(([1-9]?[0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}([1-9]?[0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\/[1-2]?[0-9]|3[0-2])?\z/
    freeze
  end
end

