require 'rails_helper'

class TestModel
  include ActiveModel::Validations
  attr_accessor :expires_at

  def self.name
    'TestModel'
  end
end

RSpec.describe DateFormatValidator do
  let(:model) { TestModel.new }

  shared_examples 'a date format validator' do
    let(:validator) { described_class.new(attributes: [:expires_at], **options) }

    context 'with a valid date' do
      it 'does not add an error' do
        model.expires_at = valid_date
        validator.validate_each(model, :expires_at, model.expires_at)
        expect(model.errors).to be_empty
      end
    end

    context 'with an invalid date' do
      it 'adds an error' do
        model.expires_at = invalid_date
        validator.validate_each(model, :expires_at, model.expires_at)
        expect(model.errors[:expires_at]).to include(options[:message])
      end
    end

    context 'with an exact date' do
      it 'behaves as expected' do
        model.expires_at = now
        validator.validate_each(model, :expires_at, model.expires_at)
        if expected_on_exact
          expect(model.errors).to be_empty
        else
          expect(model.errors[:expires_at]).to include(options[:message])
        end
      end
    end

    context 'with a blank date' do
      it 'does not add an error' do
        model.expires_at = ''
        validator.validate_each(model, :expires_at, model.expires_at)
        expect(model.errors).to be_empty
      end
    end
  end

  describe 'with Proc' do
    let(:now) { Time.current }
    context 'with gte option' do
      let(:options) { { gte: ->(_) { now }, message: '過去の日付は指定できません。' } }
      let(:valid_date) { now.tomorrow }
      let(:invalid_date) { now.yesterday }
      let(:expected_on_exact) { true }
      include_examples 'a date format validator'
    end

    context 'with gt option' do
      let(:options) { { gt: ->(_) { now }, message: '過去の日付は指定できません。' } }
      let(:valid_date) { now.tomorrow }
      let(:invalid_date) { now.yesterday }
      let(:expected_on_exact) { false }
      include_examples 'a date format validator'
    end

    context 'with lte option' do
      let(:options) { { lte: ->(_) { now }, message: '未来の日付は指定できません。' } }
      let(:valid_date) { now.yesterday }
      let(:invalid_date) { now.tomorrow }
      let(:expected_on_exact) { true }
      include_examples 'a date format validator'
    end

    context 'with lt option' do
      let(:options) { { lt: ->(_) { now }, message: '未来の日付は指定できません。' } }
      let(:valid_date) { now.yesterday }
      let(:invalid_date) { now.tomorrow }
      let(:expected_on_exact) { false }
      include_examples 'a date format validator'
    end
  end

  describe 'without Proc' do
    let!(:now) { Time.current }
    context 'with gte option' do
      let(:options) { { gte: now, message: '過去の日付は指定できません。' } }
      let(:valid_date) { now.tomorrow }
      let(:invalid_date) { now.yesterday }
      let(:expected_on_exact) { true }
      include_examples 'a date format validator'
    end

    context 'with gt option' do
      let(:options) { { gt: now, message: '過去の日付は指定できません。' } }
      let(:valid_date) { now.tomorrow }
      let(:invalid_date) { now.yesterday }
      let(:expected_on_exact) { false }
      include_examples 'a date format validator'
    end

    context 'with lte option' do
      let(:options) { { lte: now, message: '未来の日付は指定できません。' } }
      let(:valid_date) { now.yesterday }
      let(:invalid_date) { now.tomorrow }
      let(:expected_on_exact) { true }
      include_examples 'a date format validator'
    end

    context 'with lt option' do
      let(:options) { { lt: now, message: '未来の日付は指定できません。' } }
      let(:valid_date) { now.yesterday }
      let(:invalid_date) { now.tomorrow }
      let(:expected_on_exact) { false }
      include_examples 'a date format validator'
    end
  end

  context 'without message option' do
    let(:now) { Time.current }

    context 'with gte option' do
      let(:validator) { described_class.new(attributes: [:expires_at], gte: now) }
      it 'adds a default error message' do
        model.expires_at = now.yesterday
        validator.validate_each(model, :expires_at, model.expires_at)
        expect(model.errors[:expires_at]).to include("は " + now.to_time.to_s(:date) + " 以降で設定してください。")
      end
    end

    context 'with gt option' do
      let(:validator) { described_class.new(attributes: [:expires_at], gt: now) }
      it 'adds a default error message' do
        model.expires_at = now
        validator.validate_each(model, :expires_at, model.expires_at)
        expect(model.errors[:expires_at]).to include("は " + now.to_time.to_s(:date) + " よりあとに設定してください。")
      end
    end

    context 'with lte option' do
      let(:validator) { described_class.new(attributes: [:expires_at], lte: now) }
      it 'adds a default error message' do
        model.expires_at = now.tomorrow
        validator.validate_each(model, :expires_at, model.expires_at)
        expect(model.errors[:expires_at]).to include("は " + now.to_time.to_s(:date) + " 以前で設定してください。")
      end
    end

    context 'with lt option' do
      let(:validator) { described_class.new(attributes: [:expires_at], lt: now) }
      it 'adds a default error message' do
        model.expires_at = now
        validator.validate_each(model, :expires_at, model.expires_at)
        expect(model.errors[:expires_at]).to include("は " + now.to_time.to_s(:date) + " よりまえに設定してください。")
      end
    end
  end
end
