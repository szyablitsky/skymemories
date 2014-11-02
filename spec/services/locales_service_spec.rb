require 'spec_helper'

describe LocalesService do
  describe '.get_locale_from' do
    subject { LocalesService.get_locale_from(params) }

    context 'shoud return default locale if params[:locale] is empty' do
      let(:params) { { } }
      it { is_expected.to eq 'ru' }
    end

    context 'shoud return default locale if params[:locale] has invalid value' do
      let(:params) { { locale: '' } }
      it { is_expected.to eq 'ru' }
    end

    context 'shoud return back params[:locale] value if params[:locale] has valid value' do
      let(:params) { { locale: 'he' } }
      it { is_expected.to eq 'he' }
    end
  end
end