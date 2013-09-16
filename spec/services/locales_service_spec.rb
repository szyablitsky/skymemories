require 'spec_helper'

describe LocalesService do

  describe "get_locale_from" do
    it "shoud return default locale if params[:locale] is empty" do
      params = {}
      LocalesService.get_locale_from(params).should eq 'ru'
    end
    it "shoud return default locale if params[:locale] has invalid value" do
      params = { locale: '' }
      LocalesService.get_locale_from(params).should eq 'ru'
    end
    it "shoud return back params[:locale] value if params[:locale] has valid value" do
      params = { locale: 'he' }
      LocalesService.get_locale_from(params).should eq 'he'
    end
  end

end