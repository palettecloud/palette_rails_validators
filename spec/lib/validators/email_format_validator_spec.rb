require "spec_helper"

module Test
  EmailFormatValidatable = Struct.new(:email, :strict) do
    include ActiveModel::Validations

    validates :email, email_format: true,             unless: :strict
    validates :email, email_format: { strict: true }, if:     :strict
  end
end

RSpec.describe EmailFormatValidator, type: :model do
  subject { model.valid? }

  let(:model) { Test::EmailFormatValidatable.new(email, strict) }

  shared_examples_for 'valid email address' do |email|
    context "email is '#{email}'" do
      let(:email) { email }

      it { is_expected.to be true }
    end
  end

  shared_examples_for 'invalid email address' do |email|
    context "email is '#{email}'" do
      let(:email) { email }

      it { is_expected.to be false }
    end
  end

  context 'strict: false' do
    let(:strict) { false }

    it_behaves_like 'valid email address', 'test@example.com'

    context "host includes '.'" do
      it_behaves_like 'valid email address', 'test.test@example.com'
    end

    context "host includes '_'" do
      it_behaves_like 'valid email address', 'test_test@example.com'
    end

    context "host includes '-'" do
      it_behaves_like 'valid email address', 'test-test@example.com'
    end

    context "host includes '+'" do
      it_behaves_like 'valid email address', 'test+test@example.com'
    end

    context 'domain consists of threee parts' do
      it_behaves_like 'valid email address', 'test@example.example.com'
    end

    context "host includes successive '.'" do
      it_behaves_like 'valid email address', 'test..test@example.com'
    end

    context "host includes '.' just before '@'" do
      it_behaves_like 'valid email address', 'test.@example.com'
    end

    context 'email with length = 200' do
      it_behaves_like 'valid email address', 't' * 188 + '@example.com'
    end

    context 'domain does not have top level domain' do
      it_behaves_like 'invalid email address', 'test@example'
    end

    context "domain includes successive '.'" do
      it_behaves_like 'invalid email address', 'test@example..com'
    end

    context "domain includes '.' next to '@'" do
      it_behaves_like 'invalid email address', 'test@.example.com'
    end

    context 'email with length = 201' do
      it_behaves_like 'invalid email address', 't' * 189 + '@example.com'
    end

    context "domain is 'ezweb.ne.jp'" do
      context "host includes successive '.'" do
        it_behaves_like 'invalid email address', 'test..test@ezweb.ne.jp'
      end

      context "host includes '.' just before '@'" do
        it_behaves_like 'invalid email address', 'test.@ezweb.ne.jp'
      end

      context "domain includes ',' instead of '." do
        it_behaves_like 'invalid email address', 'test@ezweb,ne,jp'
      end
    end
  end

  context 'strict: true' do
    let(:strict) { true }

    it_behaves_like 'valid email address', 'test@example.com'

    context "host includes '.'" do
      it_behaves_like 'valid email address', 'test.test@example.com'
    end

    context "host includes '_'" do
      it_behaves_like 'valid email address', 'test_test@example.com'
    end

    context "host includes '-'" do
      it_behaves_like 'valid email address', 'test-test@example.com'
    end

    context "host includes '+'" do
      it_behaves_like 'valid email address', 'test+test@example.com'
    end

    context 'domain consists of threee parts' do
      it_behaves_like 'valid email address', 'test@example.example.com'
    end

    context 'email with length = 200' do
      it_behaves_like 'valid email address', 't' * 188 + '@example.com'
    end

    context "host includes successive '.'" do
      it_behaves_like 'invalid email address', 'test..test@example.com'
    end

    context "host includes '.' just before '@'" do
      it_behaves_like 'invalid email address', 'test.@example.com'
    end

    context 'domain does not have top level domain' do
      it_behaves_like 'invalid email address', 'test@example'
    end

    context "domain includes successive '.'" do
      it_behaves_like 'invalid email address', 'test@example..com'
    end

    context "domain includes '.' next to '@'" do
      it_behaves_like 'invalid email address', 'test@.example.com'
    end

    context "domain includes ',' instead of '." do
      it_behaves_like 'invalid email address', 'test@example,com'
    end

    context 'email with length = 201' do
      it_behaves_like 'invalid email address', 't' * 189 + '@example.com'
    end
  end
end
