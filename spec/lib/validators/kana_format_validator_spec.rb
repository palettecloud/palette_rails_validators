require "rails_helper"

module Test
  KanaFormatValidatable = Struct.new(:kana) do
    include ActiveModel::Validations

    validates :kana, kana_format: true
  end
end

RSpec.describe KanaFormatValidator, type: :model do
  subject { model.valid? }

  let(:model) { Test::KanaFormatValidatable.new(kana) }

  shared_examples_for 'valid kana' do |kana|
    context "kana is '#{kana}'" do
      let(:kana) { kana }

      it { is_expected.to be true }
    end
  end

  shared_examples_for 'invalid kana' do |kana|
    context "kana is '#{kana}'" do
      let(:kana) { kana }

      it { is_expected.to be false }
    end
  end

  # 基本的なカタカナ
  it_behaves_like 'valid kana', 'カタカナ'
  it_behaves_like 'valid kana', 'ｶﾀｶﾅ'
  it_behaves_like 'valid kana', 'アイウエオ'
  it_behaves_like 'valid kana', 'ｱｲｳｴｵ'

  # ハイフン・長音記号
  it_behaves_like 'valid kana', 'コーポレーション'
  it_behaves_like 'valid kana', 'アーティスト'
  it_behaves_like 'valid kana', 'テスト－カブシキガイシャ'
  it_behaves_like 'valid kana', 'テストｰカブシキガイシャ'
  it_behaves_like 'valid kana', 'テスト-カブシキガイシャ'

  # 水平バー（―）を含むケース
  it_behaves_like 'valid kana', 'テスト―カブシキガイシャ'
  it_behaves_like 'valid kana', 'カブシキガイシャ―テスト'
  it_behaves_like 'valid kana', 'アイウエオ―カキクケコ'

  # 中黒（・、･）
  it_behaves_like 'valid kana', 'タナカ・タロウ'
  it_behaves_like 'valid kana', 'ﾀﾅｶ･ﾀﾛｳ'

  # スペース
  it_behaves_like 'valid kana', 'タナカ タロウ'
  it_behaves_like 'valid kana', 'ﾀﾅｶ ﾀﾛｳ'
  it_behaves_like 'valid kana', 'タナカ　タロウ'

  # 括弧
  it_behaves_like 'valid kana', '（カブ）タナカ'
  it_behaves_like 'valid kana', '(カブ)タナカ'
  it_behaves_like 'valid kana', 'タナカ（カブ）'

  # スラッシュ
  it_behaves_like 'valid kana', 'タナカ／タロウ'
  it_behaves_like 'valid kana', 'タナカ/タロウ'

  # アンパサンド
  it_behaves_like 'valid kana', 'タナカ＆タロウ'
  it_behaves_like 'valid kana', 'タナカ&タロウ'

  # ピリオド（．、.）を含むケース
  it_behaves_like 'valid kana', 'カブシキガイシャ．タナカ'
  it_behaves_like 'valid kana', 'タナカ．タロウ'
  it_behaves_like 'valid kana', 'A.B.C'
  it_behaves_like 'valid kana', 'カブシキガイシャ.タナカ'
  it_behaves_like 'valid kana', 'タナカ.タロウ'
  it_behaves_like 'valid kana', 'TEST.CO'

  # 全角英数字
  it_behaves_like 'valid kana', 'ＡＢＣＤ'
  it_behaves_like 'valid kana', '１２３４'
  it_behaves_like 'valid kana', 'カブシキガイシャＡＢＣ'

  # 半角英数字
  it_behaves_like 'valid kana', 'ABCD'
  it_behaves_like 'valid kana', '1234'
  it_behaves_like 'valid kana', 'カブシキガイシャABC'
  it_behaves_like 'valid kana', 'テスト123'

  # 複合的なケース（水平バーとピリオドの組み合わせ）
  it_behaves_like 'valid kana', 'カブシキガイシャ―タナカ.CO'
  it_behaves_like 'valid kana', 'TEST―タナカ．コーポレーション'
  it_behaves_like 'valid kana', 'A.B.C―テスト'

  # 不正なケース
  it_behaves_like 'invalid kana', 'ひらがな'
  it_behaves_like 'invalid kana', '漢字'
  it_behaves_like 'invalid kana', 'テスト@マーク'
  it_behaves_like 'invalid kana', 'テスト#ハッシュ'
  it_behaves_like 'invalid kana', 'テスト$ドル'
  it_behaves_like 'invalid kana', 'テスト%パーセント'
  it_behaves_like 'invalid kana', 'テスト^キャレット'
  it_behaves_like 'invalid kana', 'テスト*アスタリスク'
  it_behaves_like 'invalid kana', 'テスト=イコール'
  it_behaves_like 'invalid kana', 'テスト+プラス'
  it_behaves_like 'invalid kana', 'テスト[カッコ]'
  it_behaves_like 'invalid kana', 'テスト{カッコ}'
  it_behaves_like 'invalid kana', 'テスト|パイプ'
  it_behaves_like 'invalid kana', 'テスト\\バックスラッシュ'
  it_behaves_like 'invalid kana', 'テスト:コロン'
  it_behaves_like 'invalid kana', 'テスト;セミコロン'
  it_behaves_like 'invalid kana', "テスト'クォート"
  it_behaves_like 'invalid kana', 'テスト"ダブルクォート'
  it_behaves_like 'invalid kana', 'テスト<カッコ>'
  it_behaves_like 'invalid kana', 'テスト,カンマ'
  it_behaves_like 'invalid kana', 'テスト?クエスチョン'
  it_behaves_like 'invalid kana', 'テスト!エクスクラメーション'

  # 空文字・nil
  context 'kana is nil' do
    let(:kana) { nil }

    it { is_expected.to be true }
  end

  context 'kana is empty' do
    let(:kana) { '' }

    it { is_expected.to be true }
  end

  context 'kana is blank' do
    let(:kana) { '   ' }

    it { is_expected.to be true }
  end

  # 長さ制限のテスト
  context 'kana exceeds max length' do
    let(:kana) { 'ア' * (Constants::PaletteLengthPattern::STRING + 1) }

    it { is_expected.to be false }
  end
end
