require 'spec_helper'
require 'nippo/configuration'

describe Nippo::Configuration do
  before { ENV['HOME'] = fake_home }

  describe '.dir' do
    subject { described_class.dir }
    it { expect(subject).to eq(File.join(fake_home, '.nippo')) }
  end

  describe '.file' do
    subject { described_class.file}
    it { expect(subject).to eq(File.join(fake_home, '.nippo', 'config.yml'))}
  end

  context 'instance methods' do
    before { described_class.stub!(:file).and_return(fake_congfiguration_file)}
    let(:configuration) { described_class.new }

    describe '#new' do
      subject { configuration }
      it { expect(subject.title).to eq('毎日日報') }
      it { expect(subject.root_dir).to eq('/Users/hrysd/daily_nippo') }
    end

    context 'when today is 2013/09/22' do
      before { Timecop.travel(2013, 9, 22, 0, 0, 0) }

      describe '#daily_dir' do
        subject { configuration.daily_dir }
        it { expect(subject).to eq('/Users/hrysd/daily_nippo/september')}
      end

      describe '#daily_file' do
        subject { configuration.daily_file }
        it { expect(subject).to eq('/Users/hrysd/daily_nippo/september/daily.md') }
      end

      after { Timecop.return }
    end
  end
end
