require 'active_model'
require 'active_support/all'
require 'timecop'
require_relative '../lib/validators/date_format_validator'
require_relative '../lib/validators/kana_format_validator'
require_relative '../lib/constants/palette_length_pattern'
require_relative '../lib/constants/palette_regex_pattern'

Time.zone = 'Tokyo'

# This file sets up the test environment for RSpec, including required libraries and configuration.
