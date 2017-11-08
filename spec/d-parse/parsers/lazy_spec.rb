# frozen_string_literal: true

describe DParse::Parsers::Lazy do
  let(:char) { DParse::Parsers::Char.new('a') }
  let(:parser) { described_class.new { char } }

  example { expect(parser).to parse('a').up_to(1) }
  example { expect(parser).to parse('aa').up_to(1) }
  example { expect(parser).to parse('ab').up_to(1) }
  example { expect(parser).not_to parse('') }
  example { expect(parser).not_to parse('b') }

  describe '#inspect' do
    subject { parser.inspect }

    it { is_expected.to eql('lazy(?)') }
  end
end
