require 'spec_helper'

module Test
  OrderFormatValidatable = Struct.new(:order) do
    include ActiveModel::Validations

    validates :order, order_format: true
  end
end

RSpec.describe OrderFormatValidator, type: :model do
  subject { model.valid? }

  let(:model) { Test::OrderFormatValidatable.new(order) }

  context 'When value is less than 1' do
    let(:order) { 0 }

    it 'order is invalid' do
      is_expected.to be false
    end
  end

  context 'When value is 1' do
    let(:order) { 1 }

    it 'order is valid' do
      is_expected.to be true
    end
  end

  context 'When value is greater than 200_000_000' do
    let(:order) { 200_000_001 }

    it 'order is invalid' do
      is_expected.to be false
    end
  end

  context 'When value is 200_000_000' do
    let(:order) { 200_000_00 }

    it 'order is valid' do
      is_expected.to be true
    end
  end

  context 'When value is not integer' do
    let(:order) { '1' }

    it 'order is invalid' do
      is_expected.to be false
    end
  end
end
